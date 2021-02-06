<template>
  <div>
    <b-modal id="cart" hide-footer title="Cart">
      <div v-if="getCart.length > 0">
        <div class="container grow">
          <transition-group name="anim" tag="div">
            <cart v-for="(element, i) in getCart" :key="i" :data="element" />
          </transition-group>
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
            <button type="button" class="btn btn-red btn-sm btn-block">
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
    </b-modal>
  </div>
</template>
<script>
import cart from '../slice/CartItem'
import currency from '../../helpers/currency'
import { mapGetters, mapActions } from 'vuex'
export default {
  mixins: [currency],
  components: { cart },
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
      setProduct: 'menu/setProduct'
    })
  },
  mounted () {
    this.setProduct()
  }
}
</script>


