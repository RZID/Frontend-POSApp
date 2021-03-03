const page = {
    namespaced: true,
    state: () => {
        return {
            currentPage: 1
        }
    },
    mutations: {
        thisPageSet (state, payload) {
            state.currentPage = payload
        }
    },
    actions: {
        setPage ({ commit }, data) {
            commit('thisPageSet', data)
        }
    },
    getters: {
        getPage (state) {
            return state.currentPage
        }
    }
}
export default page
