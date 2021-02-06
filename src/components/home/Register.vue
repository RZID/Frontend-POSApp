<template>
  <div class="container">
    <div class="row h-100">
      <div class="col-md-5">
        <div class="h-100 d-flex">
          <div class="mx-3 my-md-0 my-3 align-self-center">
            <h2>Register</h2>
            <div class="d-desc">
              <h5 class="m-0">Welcome To Kopimu Point Of Sales</h5>
              <p class="m-0 text-justify">
                Please fill the form first and feel free to wait until you
                verified!
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="col bg-light">
        <form @submit.prevent="submitReg()">
          <div class="h-100 d-flex">
            <div class="w-100 align-self-center">
              <div class="py-5">
                <div class="container">
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1">
                        <i class="uil uil-user"></i>
                      </span>
                    </div>
                    <input
                      type="text"
                      class="form-control"
                      v-model="formData.name"
                      placeholder="Full Name"
                      aria-describedby="basic-addon1"
                      required
                    />
                  </div>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1">
                        <i class="uis uis-at"></i>
                      </span>
                    </div>
                    <input
                      type="email"
                      class="form-control"
                      v-model="formData.email"
                      placeholder="E-Mail Address"
                      aria-describedby="basic-addon1"
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
                      v-model="formData.password"
                      placeholder="Password"
                      aria-describedby="basic-addon1"
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
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <label class="input-group-text" for="inputGroupSelect01"
                        ><i class="uil uil-label-alt"></i
                      ></label>
                    </div>
                    <select
                      class="custom-select"
                      id="inputGroupSelect01"
                      v-model="formData.access"
                      required
                    >
                      <option value="0" disabled>Choose Role...</option>
                      <option
                        v-for="(items, index) in getCategory"
                        :key="index"
                        :value="items.id_role"
                      >
                        {{ items.name_role }}
                      </option>
                    </select>
                  </div>
                  <p>
                    Already have account?
                    <router-link class="linker" to="/login"
                      >Click here to login
                    </router-link>
                  </p>
                  <button type="submit" class="btn btn-blue">Register</button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
import alert from '../../helpers/swal'
export default {
  mixins: [alert],
  data: () => {
    return {
      responser: '',
      password: 'password',
      formData: {
        name: '',
        email: '',
        password: '',
        access: 0
      }
    }
  },
  computed: {
    ...mapGetters({
      getCategory: 'category/getCategory',
      getStatus: 'user/getStatusReg'
    })
  },
  methods: {
    appendPass () {
      this.password = this.password === 'password' ? 'text' : 'password'
    },
    ...mapActions({
      optCategory: 'category/acGetCategory',
      optRegister: 'user/acRegister'
    }),
    submitReg () {
      this.isLoading = true

      this.optRegister(this.formData).then(() => {
        this.toastSuccess('Registered! Wait for verification from admin')
      }).catch((err) => {
        if (err) {
          this.toastDanger(err.response.data.message)
        }
      })
    }
  },
  mounted () {
    this.optCategory()
  }
}
</script>
