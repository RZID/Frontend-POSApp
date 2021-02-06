<template>
  <div class="container d-flex h-100">
    <div class="align-self-center w-100">
      <div class="container">
        <div class="card bg-login border-0 shadow">
          <div class="h-100 d-block" v-if="this.$route.path === '/login'">
            <login />
          </div>
          <div v-else>
            <register />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import login from '../components/home/Login'
import register from '../components/home/Register'
import '../assets/css/home.css'

export default {
  data () {
    return {
    }
  },
  components: { login, register },
  mounted () {
  }
}
</script>
