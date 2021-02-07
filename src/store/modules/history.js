import Axios from 'axios'
import currency from '../../helpers/currency'
const history = {
    namespaced: true,
    state: () => {
        return {
            data: [],
            isEmpty: false,
            pageProp: {},
            dataCard: {
                todayIncome: '',
                totalOrder: '',
                yearIncome: ''
            }
        }
    },
    mutations: {
        mtSetHistory (state, payload) {
            state.data = payload
        },
        mtSetEmpty (state, payload) {
            state.isEmpty = payload
        },
        mtSetPageProp (state, payload) {
            state.pageProp = payload
        }
    },
    actions: {
        setHistory (context, data) {
            const filterDate = data.betweenStart && data.betweenEnd ? `betweenStart=${data.betweenStart}&betweenEnd=${data.betweenEnd}&` : ''
            const page = data.page ? `page=${data.page}` : ''
            Axios.get(`${process.env.VUE_APP_BACKEND}/history?${filterDate}${page}`, {
                headers:
                    { 'token': context.getters.getToken }
            }).then((res) => {
                if (res.status === 204) {
                    context.commit('mtSetPageProp', '')
                    context.commit('mtSetEmpty', true)
                } else {
                    const dataPage = {
                        filteredData: res.data.data.filteredData,
                        limit: res.data.data.limit,
                        totalRows: res.data.data.totalRows
                    }
                    context.commit('mtSetPageProp', dataPage)
                    context.commit('mtSetEmpty', false)
                    const data = []
                    res.data.data.data.map(el => data.push({
                        invoice: '#' + el.invoice,
                        cashier: el.cashier,
                        date: el.date,
                        orders: el.product,
                        amount: currency.methods.toRupiah(el.amount)
                    }))
                    context.commit('mtSetHistory', data)
                }
            }).catch(err => {
                context.commit('mtSetPageProp', '')
                console.error(err)
            })
        }
    },
    getters: {
        getToken (state, getters, rootState, rootGetters) {
            return rootGetters['user/getToken']
        },
        getHistory (state) {
            return state.data
        },
        getStatusHistory (state) {
            return state.isEmpty
        },
        getPageProp (state) {
            return state.pageProp
        }
    }
}
export default history