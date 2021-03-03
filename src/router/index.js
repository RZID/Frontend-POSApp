import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Menus from '../views/Menu.vue'
import Details from '../views/Details.vue'
import History from '../views/History.vue'
import store from '../store/index'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/login'
  },
  {
    path: '/login',
    name: 'Login',
    component: Home,
    meta: {
      auth: false,
      for: 'unlog'
    }
  },
  {
    path: '/register',
    name: 'Register',
    component: Home,
    meta: {
      auth: false,
      for: 'unlog'
    }
  },
  {
    path: '/menu',
    name: 'Menu',
    component: Menus,
    meta: {
      auth: true
    }
  },
  {
    path: '/detail/:id',
    name: 'Detail Product',
    component: Details,
    meta: {
      auth: true,
      restrict: '1'
    }
  },
  {
    path: '/history',
    name: 'History',
    component: History,
    meta: {
      auth: true
    }
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  if (to.meta.auth) {
    if (store.getters['user/getToken']) {
      if (to.meta.restrict === '1') {
        if (store.getters['user/getUserdata'].role === '1') {
          next()
        } else {
          router.push('/').catch(() => { })
        }
      } else {
        next()
      }
    }
    else {
      router.push('/login').catch(() => { })
    }
  } else if (to.meta.for === 'unlog') {
    if ((store.getters['user/getToken'])) {
      router.push('/menu').catch(() => { })
    } else {
      next()
    }
  } else {
    next()
  }
})

export default router
