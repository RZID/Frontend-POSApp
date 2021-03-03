import Axios from 'axios'
import Alert from '../../helpers/swal'
import Swal from 'sweetalert2'
import defaultMenu from '../default/menu'
const mdMenu = {
    namespaced: true,
    state: () => {
        return {
            sidebar: false,
            isEmpty: false,
            data: [],
            page: [],
            inCart: [],
            filterBar: false
        }
    },
    mutations: {
        mtSidebar (state) {
            state.sidebar = !state.sidebar
        },
        mtProduct (state, payload) {
            state.data = payload
        },
        mtAddToCart (state, payload) {
            const ready = {
                id: payload.id,
                name: payload.name,
                image: payload.image,
                price: payload.price,
                amount: 1
            }
            state.inCart.push(ready)
        },
        mtRemoveFromCart (state, payload) {
            state.inCart = state.inCart.filter(el => el.id !== payload)
        },
        mtIncrement (state, id) {
            state.inCart.map(el => {
                if (el.id === id) {
                    el.amount += 1
                }
            })
        },
        mtDecrement (state, id) {
            state.inCart.map(el => {
                if (el.id === id) {
                    el.amount -= 1
                }
            })
        },
        removeAll (state) {
            state.inCart = []
        },
        mtFilterBar (state) {
            state.filterBar = !state.filterBar
        },
        mtPage (state, payload) {
            state.page = payload
        },
        setEmpty (state, payload) {
            state.isEmpty = payload
        },
        resetState (state) {
            Object.assign(state, defaultMenu)
        }
    },
    actions: {
        acReset ({ commit }) {
            commit('resetState')
        },
        setFilterBar ({ commit }) {
            return commit('mtFilterBar')
        },
        setSidebar ({ commit }) {
            return commit('mtSidebar')
        },
        addToCart (context, data) {
            const same = context.state.inCart.filter(el => el.id === data.id)
            if (same.length > 0) {
                Alert.methods.alertQuestion(`Delete ${data.name} from cart?`).then(() => {
                    context.commit('mtRemoveFromCart', data.id)
                })
            } else {
                context.commit('mtAddToCart', data)
            }
        },
        setProduct ({ commit, getters }, filter) {
            let filtering = ''
            if (filter) {
                const search = !filter.by && !filter.like ? '' : `searchBy=${filter.by}&searchLike=${filter.like}&`
                const page = !filter.page ? '' : `page=${filter.page}&`
                const order = !filter.order && !filter.orderMethod ? '' : `order=${filter.order}&orderMethod=${filter.orderMethod}&`
                const limit = !filter.limit ? '' : `limit=${filter.limit}`
                filtering = search + page + order + limit
            }
            Axios.get(`${process.env.VUE_APP_BACKEND}/product?${filtering}`, {
                headers: {
                    'token': getters.getToken
                }
            }).then((res) => {
                if (res.status === 200) {
                    const pageProperties = {
                        filteredData: res.data.data.filteredData,
                        limit: res.data.data.limit,
                        page: res.data.data.page,
                        totalRows: res.data.data.totalRows,
                    }
                    commit('setEmpty', false)
                    commit('mtPage', pageProperties)
                    commit('mtProduct', res.data.data.data)
                } else if (res.status === 204) {
                    commit('setEmpty', true)
                }
            }).catch(err => {
                Alert.methods.toastDanger(err.message)
            })
        },
        increment (context, id) {
            const data = context.getters.getCart.filter(el => el.id === id)
            if (data.length === 1 && data[0].amount < 100) {
                context.commit('mtIncrement', id)
            }
        },
        decrement (context, id) {
            const data = context.getters.getCart.filter(el => el.id === id)
            if (data.length === 1) {
                if (data[0].amount > 1) {
                    context.commit('mtDecrement', id)
                } else if (data[0].amount === 1) {
                    Swal.fire({
                        title: 'Are you sure?',
                        text: `Wan't to delete ${data[0].name} from cart?`,
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Sure!'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            context.commit('mtRemoveFromCart', id)
                        }
                    })
                }
            }
        },
        saveHistory (context) {
            const product = context.getters.getCart.map(el => (el.id.toString() + ',').repeat(el.amount)).join('').slice(0, -1)
            const data = {
                cashier: context.getters.getUserdata.name,
                product: product
            }
            const token = {
                headers: {
                    'token': `${context.getters.getToken}`
                }
            }

            return new Promise((resolve, reject) => {
                Axios.post(`${process.env.VUE_APP_BACKEND}/history`, data, token).then((result) => {
                    context.commit('removeAll')
                    if (result.status === 200) {
                        resolve(true)
                    } else {
                        reject(true)
                    }
                }).catch(err => {
                    reject(err)
                })
            })
        },
        acRemoveAll ({ commit }) {
            return commit('removeAll')
        }
    },
    getters: {
        getUserdata (state, getters, rootState, rootGetters) {
            return rootGetters['user/getUserdata']
        },
        getToken (state, getters, rootState, rootGetters) {
            return rootGetters['user/getToken']
        },
        getSidebar (state) {
            return state.sidebar
        },
        getProduct (state) {
            return state.data
        },
        getCart (state) {
            return state.inCart
        },
        getFilterBar (state) {
            return state.filterBar
        },
        getPage (state) {
            return state.page
        },
        getEmpty (state) {
            return state.isEmpty
        }
    }
}
export default mdMenu
