<template>
  <div>
    <b-modal
      class="border-0"
      id="checkOut"
      hide-header
      hide-footer
      hide-header-close
    >
      <div v-if="getCartData.length > 0">
        <div class="row">
          <div class="col">
            <h4>Checkout</h4>
          </div>
          <div class="col text-right">
            <h6>Receipt no: #31231235513</h6>
          </div>
        </div>
        <h6>
          Cashier :
          {{ getUserdata.name }}
        </h6>
        <div class="mt-5 mb-3">
          <div class="row" v-for="(element, i) in getCartData" :key="i">
            <div class="col-7">{{ element.name }} {{ element.amount }}x</div>
            <div class="col text-right">
              {{ toRupiah(element.price * element.amount) }}
            </div>
          </div>
          <div class="row">
            <div class="col-7">Ppn 10%</div>
            <div class="col text-right">
              {{
                toRupiah(
                  getCartData
                    .map((el) => el.price * el.amount)
                    .reduce((a, b) => a + b) / 10
                )
              }}
            </div>
          </div>
          <div class="row">
            <div class="col w-100 text-right">
              Total :
              {{
                toRupiah(
                  getCartData
                    .map((el) => el.price * el.amount)
                    .reduce((a, b) => a + b) /
                    10 +
                    getCartData
                      .map((el) => el.price * el.amount)
                      .reduce((a, b) => a + b)
                )
              }}
            </div>
          </div>
          <div class="row">
            <div class="col">Payment : Cash</div>
          </div>
        </div>
        <div class="row">
          <div class="col-4 border-right">
            <button
              type="button"
              class="btn h-100 btn-green btn-sm btn-block"
              @click="saveHistory()"
            >
              Save Receipt
            </button>
          </div>
          <div class="col border-left">
            <button type="button" class="btn btn-red btn-sm btn-block">
              Print
            </button>
            <h6 class="m-0 my-1 text-center">Or</h6>
            <button type="button" class="btn btn-primary2 btn-sm btn-block">
              Send E-Mail
            </button>
          </div>
        </div>
        <div class="row pt-2">
          <div class="col text-center">
            <b-link
              class="text-muted text-decoration-none"
              @click="$bvModal.hide('checkOut')"
              >Go back, i want to change</b-link
            >
          </div>
        </div>
      </div>
    </b-modal>
  </div>
</template>
<script>
import { mapActions, mapGetters } from 'vuex'
import Alert from '../../helpers/swal'
import currency from '../../helpers/currency'
export default {
  mixins: [currency, Alert],
  computed: {
    ...mapGetters({
      getUserdata: 'user/getUserdata',
      getCartData: 'menu/getCart'
    })
  },
  methods: {
    ...mapActions({
      setHistory: 'menu/saveHistory'
    }),
    saveHistory () {
      this.alertQuestion('Are you sure?', 'Please check the items in cart again before save').then(() => {
        this.setHistory().then(() => {
          this.toastSuccess(`Nice work ${this.getUserdata.name}!`)
        }).catch(err => this.toastDanger(err.data.message)).finally(() => {
          this.$bvModal.hide('checkOut')
        })
      })
    }
  }
}
</script>
