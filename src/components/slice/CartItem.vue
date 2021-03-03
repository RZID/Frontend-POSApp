<template>
  <div>
    <div>
      <div class="card my-3 shadow border-0">
        <div class="row no-gutters">
          <div class="col-4">
            <div
              :style="
                'background-image:url(' +
                getImage(data.image) +
                ')' +
                ', url(' +
                getImage('default.jpg') +
                ')'
              "
              class="img-cart h-100"
              :alt="'Image Of ' + data.name"
            ></div>
          </div>
          <div class="col-8">
            <div class="card-body">
              <h5 class="card-title">{{ data.name }}</h5>
              <h6>
                <div class="row no-gutters">
                  <div class="col-lg-6">
                    <div class="input-group input-group-sm mb-3">
                      <div class="input-group-prepend">
                        <button
                          class="btn-outline-green input-group-text"
                          @click="decrement(data.id)"
                        >
                          <i class="uil uil-minus"></i>
                        </button>
                      </div>
                      <input
                        type="number"
                        class="form-control slider-green text-center"
                        aria-label="Sizing example input"
                        aria-describedby="inputGroup-sizing-sm"
                        :value="data.amount"
                        disabled
                      />
                      <div class="input-group-append">
                        <button
                          class="btn-outline-green input-group-text"
                          @click="increment(data.id)"
                        >
                          <i class="uil uil-plus"></i>
                        </button>
                      </div>
                    </div>
                  </div>
                  <div
                    class="col-lg text-right"
                    v-resize-text="{ maxFontSize: '16px' }"
                  >
                    {{ toRupiah(data.price * data.amount) }}
                  </div>
                </div>
              </h6>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import currency from '../../helpers/currency'
import { mapGetters, mapActions } from 'vuex'
export default {
  props: ['data'],
  computed: {
    ...mapGetters({
      getCart: 'menu/getCart'
    })
  },
  methods: {
    ...mapActions({
      incrementing: 'menu/increment',
      decrementing: 'menu/decrement'
    }),
    getImage (img) {
      return `${process.env.VUE_APP_BACKEND}/image/${img}`
    },
    increment (id) {
      return this.incrementing(id)
    },
    decrement (id) {
      return this.decrementing(id)
    }
  },
  mixins: [currency]
}
</script>
