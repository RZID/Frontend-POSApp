<template>
  <div class="container">
    <div class="row h-100">
      <div class="col-md-5">
        <div class="h-100 d-flex">
          <div class="mx-3 my-md-0 my-3 align-self-center text-dark">
            <h2>Login</h2>
            <div class="d-desc">
              <h5 class="m-0">Welcome To Kopimu Point Of Sales</h5>
              <p class="m-0">Please Enter your E-Mail and Password</p>
            </div>
          </div>
        </div>
      </div>
      <div class="col bg-light">
        <div class="h-100 d-flex">
          <div class="w-100 align-self-center">
            <div class="py-5">
              <div class="container">
                <form @submit.prevent="login()">
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1">
                        <i class="uis uis-at"></i>
                      </span>
                    </div>
                    <input
                      type="email"
                      class="form-control"
                      placeholder="E-Mail Address"
                      aria-describedby="basic-addon1"
                      v-model="form.email"
                      required
                    />
                  </div>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1">
                        <i class="uis uis-key-skeleton"></i>
                      </span>
                    </div>
                    <input
                      :type="password"
                      class="form-control"
                      placeholder="Password"
                      aria-describedby="basic-addon1"
                      v-model="form.password"
                      required
                    />
                    <div class="input-group-append">
                      <button
                        class="btn btn-outline-secondary"
                        type="button"
                        @click="appendPass()"
                      >
                        <i
                          :class="
                            password === 'password'
                              ? 'uil uil-eye'
                              : 'uil uil-eye-slash'
                          "
                        ></i>
                      </button>
                    </div>
                  </div>
                  <p>
                    Doesn't have account?
                    <router-link class="linker" to="/register"
                      >Click here to register
                    </router-link>
                  </p>
                  <button type="submit" class="btn btn-blue">Login</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapActions } from 'vuex'
import alert from '../../helpers/swal'
export default {
  mixins: [alert],
  data: () => {
    return {
      form: {
        email: '',
        password: ''
      },
      password: 'password'
    }
  },
  methods: {
    ...mapActions({
      reqLogin: 'user/acLogin'
    }),
    appendPass () {
      this.password = this.password === 'password' ? 'text' : 'password'
    },
    login () {
      this.reqLogin(this.form).then((res) => {
        this.toastLogin(res.data.message)
      }).catch((err) => {
        if (err) {
          this.toastDanger(err.response.data.message)
        }
      })
    }
  }
}
</script>
