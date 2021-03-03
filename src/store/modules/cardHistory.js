import Axios from 'axios'
import Moment from 'moment'
import summary from '../../helpers/summary'
const card = {
    namespaced: true,
    state: () => {
        return {
            todayIncome: 0,
            orders: 0,
            yearIncome: 0,
            percentage: {
                todayYesterday: '',
                thisWeekLastWeek: '',
                thisYearLastYear: ''
            }
        }
    },
    mutations: {
        setDataToday (state, payload) {
            state.todayIncome = payload
        },
        setDataOrder (state, payload) {
            state.orders = payload
        },
        setDataYear (state, payload) {
            state.yearIncome = payload
        },
        setPercentage (state, payload) {
            if (payload.to === 'day') {
                state.percentage.todayYesterday = payload.data
            } else if (payload.to === 'week') {
                state.percentage.thisWeekLastWeek = payload.data
            } else {
                state.percentage.thisYearLastYear = payload.data
            }
        }
    },
    actions: {
        setCartData (context) {
            const arr = ['day', 'week', 'year']
            for (let i = 0; i < arr.length; i++) {
                const start = Moment().startOf(arr[i]).unix()
                const end = Moment().endOf(arr[i]).unix()
                const startBefore = Moment().subtract(arr[i], 1).startOf(arr[i]).unix()
                const endBefore = Moment().subtract(arr[i], 1).endOf(arr[i]).unix()
                const join = `betweenStart=${start}&betweenEnd=${end}`
                const betweenBefore = `betweenStart=${startBefore}&betweenEnd=${endBefore}`
                Axios.get(`${process.env.VUE_APP_BACKEND}/history?${join}`, {
                    headers: {
                        'token': context.getters.getToken
                    }
                }).then((res) => {
                    if (arr[i] === 'day') {
                        const thisData = res.data.data.data.map(el => el.amount).reduce((a, b) => a + b)
                        context.commit('setDataToday', thisData)
                        Axios.get(`${process.env.VUE_APP_BACKEND}/history?${betweenBefore}`, {
                            headers: {
                                'token': context.getters.getToken
                            }
                        }).then((response) => {
                            const data = {
                                to: 'day',
                                data: summary.methods.setProfit(thisData, response.data.data.data.map(el => el.amount).reduce((a, b) => a + b))
                            }
                            context.commit('setPercentage', data)
                        })

                    } else if (arr[i] === 'week') {
                        const thisData = res.data.data.totalRows
                        context.commit('setDataOrder', thisData)
                        Axios.get(`${process.env.VUE_APP_BACKEND}/history?${betweenBefore}`, {
                            headers: {
                                'token': context.getters.getToken
                            }
                        }).then((response) => {
                            const data = {
                                to: 'week',
                                data: summary.methods.setProfit(thisData, response.data.data.data.map(el => el.amount).reduce((a, b) => a + b))
                            }
                            context.commit('setPercentage', data)
                        })
                    } else {
                        const thisData = res.data.data.data.map(el => el.amount).reduce((a, b) => a + b)
                        context.commit('setDataYear', thisData)
                        Axios.get(`${process.env.VUE_APP_BACKEND}/history?${betweenBefore}`, {
                            headers: {
                                'token': context.getters.getToken
                            }
                        }).then((response) => {
                            const data = {
                                to: 'year',
                                data: summary.methods.setProfit(thisData, response.data.data.data.map(el => el.amount).reduce((a, b) => a + b))
                            }
                            context.commit('setPercentage', data)
                        })
                    }
                })
            }
        }
    },
    getters: {
        getTodayIncome (state) {
            return state.todayIncome
        },
        getOrders (state) {
            return state.orders
        },
        getYearIncome (state) {
            return state.yearIncome
        },
        getPercentage (state) {
            return state.percentage
        },
        getToken (state, getters, rootState, rootGetters) {
            return rootGetters['user/getToken']
        }
    }
}
export default card