import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store/index'
Vue.config.productionTip = false
import VueResizeText from 'vue-resize-text'
Vue.use(VueResizeText)
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
