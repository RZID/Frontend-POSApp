import Vue from 'vue'
import Vuex from 'vuex'
import mdCategory from './modules/category'
import mdUser from './modules/user'
import mdMenu from './modules/menu'
import mdProduct from './modules/product'
import mdHistory from './modules/history'
import mdPage from './modules/page'
import mdCard from './modules/cardHistory'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    category: mdCategory,
    user: mdUser,
    menu: mdMenu,
    product: mdProduct,
    history: mdHistory,
    page: mdPage,
    card: mdCard
  }
})
export default store
