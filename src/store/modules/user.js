import Axios from 'axios'
import router from '../../router/index'
const mdUser = {
    namespaced: true,
    state: () => {
        return {
            token: localStorage.getItem('token') || null,
            name: localStorage.getItem('name') || null,
            role: localStorage.getItem('role') || null
        }
    },
    mutations: {
        setData (state, data) {
            state.token = data.token
            state.name = data.name
            state.role = data.role
            localStorage.setItem('token', data.token)
            localStorage.setItem('name', data.name)
            localStorage.setItem('role', data.role)
        },
        mtLogOut (state) {
            state.token = ''
            state.name = ''
            state.role = ''
            localStorage.removeItem('token')
            localStorage.removeItem('name')
            localStorage.removeItem('role')
        }
    },
    actions: {
        acRegister (context, data) {
            return new Promise((resolve, reject) => {
                Axios.post(`${process.env.VUE_APP_BACKEND}/register`, data).then((response) => {
                    resolve(response)
                }).catch((err) => { reject(err) })
            })
        },
        acLogin (context, data) {
            return new Promise((resolve, reject) => {
                Axios.post(`${process.env.VUE_APP_BACKEND}/login`, data).then((response) => {
                    if (response.status === 202) {
                        const dataRes = {
                            token: response.data.token,
                            name: response.data.name,
                            role: response.data.role.toString()
                        }
                        context.commit('setData', dataRes)
                    }
                    resolve(response)
                }).catch(err => {
                    reject(err)
                })
            })
        },
        logOut ({ commit, dispatch }) {
            dispatch('menu/acReset', null, { root: true })
            commit('mtLogOut')
            router.push('/')
        }
    },
    getters: {
        getToken (state) {
            return state.token
        },
        getUserdata (state) {
            return { name: state.name, role: state.role }
        }
    }
}
export default mdUser
