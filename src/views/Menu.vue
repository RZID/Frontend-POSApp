<template>
  <div class="h-100">
    <checkoutModal />
    <menuNav />
    <div class="row no-gutters">
      <div
        :class="
          getSidebar
            ? 'px-3 height-min-nav col-lg-2 col-md-3 col-5 height-min-nav shadow'
            : 'px-3 height-min-nav col-0-5 col-lg-2 col-md-4 col-5 h-100 shadow'
        "
      >
        <sideBar />
      </div>
      <div class="col height-min-nav overflow-auto">
        <transition name="pullPush">
          <div v-if="getFilterBar" class="shadow bg-white sticky-top">
            <filterBar />
          </div>
        </transition>
        <div class="trans">
          <div class="container my-3">
            <transition name="pullPush">
              <div v-if="getEmpty" class="text-center">
                <img
                  src="/icons/nodata.png"
                  class="img-fluid"
                  style="max-height: 250px"
                  alt=""
                />
                <h4>Found Nothing.</h4>
                <p class="text-muted">Check your filter in advance</p>
              </div>
              <div v-else>
                <div class="row">
                  <div
                    class="col-lg-4 col-sm-6 col-12 py-2"
                    v-for="(item, i) in getProduct"
                    :key="i"
                  >
                    <foods :data="item" />
                  </div>
                </div>
              </div>
            </transition>
          </div>
        </div>
      </div>

      <div class="d-none d-md-block col-md-4 height-min-nav">
        <div v-if="getCart.length > 0">
          <div class="cart-height overflow-y">
            <div class="container grow">
              <transition-group name="anim" tag="div">
                <cart
                  v-for="(element, i) in getCart"
                  :key="i"
                  :data="element"
                />
              </transition-group>
            </div>
          </div>
          <div class="d-flex container py-2 checkout-height">
            <div class="align-self-center w-100">
              <div class="row">
                <div class="col">
                  <h5 class="font-weight-bold">Total :</h5>
                </div>
                <div class="col text-right font-weight-bold">
                  {{
                    toRupiah(
                      getCart
                        .map((el) => el.price * el.amount)
                        .reduce((a, b) => a + b)
                    )
                  }}*
                </div>
              </div>
              <p>*Belum termasuk ppn</p>
              <button
                type="button"
                class="btn btn-primary2 btn-sm btn-block"
                v-b-modal.checkOut
              >
                Checkout
              </button>
              <button
                type="button"
                class="btn btn-red btn-sm btn-block"
                @click="cancel()"
              >
                Cancel
              </button>
            </div>
          </div>
        </div>
        <div v-else>
          <div class="mt-3 w-100 text-center">
            <img
              src="/icons/food-and-restaurant.svg"
              width="175px"
              alt=""
              srcset=""
            />
            <h4 v-resize-text="{ maxFontSize: '25px' }">Your cart is empty!</h4>
            <p
              class="text-muted"
              v-resize-text="{ maxFontSize: '16px', minFontSize: '10px' }"
            >
              Please add some items from the menu
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import checkoutModal from '../components/modals/Checkout'
import '../assets/css/menu.css'
import menuNav from '../components/nav/menuNav'
import sideBar from '../components/nav/sideBar'
import foods from '../components/slice/Food'
import cart from '../components/slice/CartItem'
import currency from '../helpers/currency'
import filterBar from '../components/nav/filterBar'
import Alert from '../helpers/swal'
import { mapGetters, mapActions } from 'vuex'
export default {
  mixins: [currency, Alert],
  components: { menuNav, sideBar, foods, cart, checkoutModal, filterBar },
  computed: {
    ...mapGetters({
      getSidebar: 'menu/getSidebar',
      getProduct: 'menu/getProduct',
      getCart: 'menu/getCart',
      getFilterBar: 'menu/getFilterBar',
      getEmpty: 'menu/getEmpty'
    })
  },
  methods: {
    ...mapActions({
      setProduct: 'menu/setProduct',
      setEmpty: 'menu/acRemoveAll'
    }),
    cancel () {
      this.alertQuestion('Are you sure?', 'All data in your cart will be remove').then(() => {
        this.setEmpty()
      })
    }
  },
  mounted () {
    this.setProduct()
  }
}
</script>

