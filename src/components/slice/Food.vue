<template>
  <div>
    <div class="card border-0 bg-light">
      <b-link
        class="hoverme text-dark text-decoration-none"
        @click="toCart(data)"
      >
        <div class="card-img-top">
          <div
            :style="
              'background-image:url(' +
              getImage(data.image) +
              ')' +
              ', url(' +
              getImage('default.jpg') +
              ')'
            "
            class="img-card"
            :alt="'Image of ' + data.name"
          >
            <transition name="growing">
              <div
                v-if="getCart.filter((el) => el.id === data.id).length > 0"
                class="w-100 h-100 d-flex justify-content-center bg-dim"
              >
                <div class="align-self-center">
                  <img src="/icons/tick.svg" />
                </div>
              </div>
            </transition>
          </div>
        </div>
      </b-link>
      <div class="card-body container w-100">
        <div class="row">
          <div class="col">
            <h5
              class="card-title m-0 mb-2 font-weight-bold"
              v-resize-text="{ maxFontSize: '22.5px' }"
            >
              {{ data.name }}
            </h5>
          </div>
          <div class="col-3 text-right" v-if="getUserdata.role === '1'">
            <h5 class="m-0">
              <b-link @click="editProduct(data.id)">
                <span class="badge btn-blue">
                  <i class="uil uil-edit-alt"></i>
                </span>
              </b-link>
            </h5>
          </div>
        </div>
        <h6 class="card-text m-0" v-resize-text="{ ratio: 10.2 }">
          {{ toRupiah(data.price) }}
        </h6>
      </div>
    </div>
  </div>
</template>
<script>
import currency from '../../helpers/currency'
import { mapActions, mapGetters } from 'vuex'
import Alert from '../../helpers/swal'
export default {
  props: ['data'],
  mixins: [currency, Alert],
  computed: {
    ...mapGetters({
      getCart: 'menu/getCart',
      getUserdata: 'user/getUserdata'
    })
  },
  methods: {
    ...mapActions({
      sendToCart: 'menu/addToCart',
      acRemoveAll: 'menu/acRemoveAll'
    }),
    getImage (img) {
      return `${process.env.VUE_APP_BACKEND}/image/${img}`
    },
    toCart (data) {
      this.sendToCart(data)
    },
    editProduct (id) {
      if (this.getCart.length > 0) {
        this.alertQuestion('Are you sure?', 'We will remove your current cart').then(() => {
          this.acRemoveAll()
          this.$router.push(`/detail/${id}`)
        })
      } else {
        this.$router.push(`/detail/${id}`)
      }
    }
  }
}
</script>
