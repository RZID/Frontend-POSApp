import Axios from 'axios'
const mdCategory = {
    namespaced: true,
    state: () => {
        return {
            data: []
        }
    },
    mutations: {
        mtGetCategory (state, payload) {
            state.data = payload
        }
    },
    actions: {
        acGetCategory ({ commit }) {
            Axios.get(`${process.env.VUE_APP_BACKEND}/user_role`).then(response => {
                if (response.data.statusCode === 200) {
                    commit('mtGetCategory', response.data.data.data)
                } else {
                    console.error(response)
                }
            }).catch(err => {
                console.error(err)
            })
        }
    },
    getters: {
        getCategory (state) {
            return state.data
        }
    }
}
export default mdCategory
