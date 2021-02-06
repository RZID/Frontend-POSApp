<template>
  <div
    id="app"
    :class="
      this.$route.path === '/login' || this.$route.path === '/register'
        ? 'h-100 bg-body'
        : 'h-100'
    "
  >
    <link
      rel="stylesheet"
      href="https://unicons.iconscout.com/release/v3.0.6/css/solid.css"
    />
    <link
      rel="stylesheet"
      href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"
    />
    <router-view />
  </div>
</template>
<script>
import Vue from 'vue'
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import './assets/css/styles.css'

Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
export default {
}
</script>
<style>
.page-enter-active,
.page-leave-active {
  transition: opacity 0.5s;
}
.page-enter, .page-leave-to /* .fade-leave-active in <2.1.8 */ {
  opacity: 0;
}
</style>
