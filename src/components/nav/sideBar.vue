<template>
  <div>
    <cart />
    <div class="mt-4 w-100">
      <router-link to="/menu" class="text-dark text-decoration-none">
        <div>
          <div class="d-flex">
            <div class="align-self-center">
              <img src="/icons/fork.svg" width="40px" alt="" />
              <span
                v-if="getSidebarStat"
                class="mt-2 mx-3 position-fixed font-0 grow"
                >Menu</span
              >
            </div>
          </div>
        </div>
      </router-link>
    </div>
    <div class="mt-4">
      <router-link to="/history" class="text-dark" @click="setPage(1)">
        <div>
          <img src="/icons/clipboard.svg" width="40px" alt="" />
          <span
            v-if="getSidebarStat"
            class="mt-2 mx-3 position-fixed font-0 grow"
            >History</span
          >
        </div>
      </router-link>
    </div>
    <div class="mt-4" v-if="getUserdata.role === '1'">
      <b-link class="text-dark" v-b-modal.addItem>
        <div>
          <img src="/icons/add.svg" width="40px" alt="" />
          <span
            v-if="getSidebarStat"
            class="mt-2 mx-3 position-fixed font-0 grow"
            >Add Item</span
          >
        </div>
      </b-link>
    </div>
    <b-link
      class="text-dark text-center text-decoration-none d-md-none"
      v-b-modal.cart
    >
      <div class="mt-4">
        {{ getCart.length }} <i class="uil uil-shopping-cart"></i>
        <span v-if="getSidebarStat" class="mt-2 mx-3 font-0">Cart</span>
      </div>
    </b-link>
    <div class="mt-4">
      <b-link class="text-dark" @click="signOut()">
        <div>
          <img src="/icons/sign-out-alt.svg" width="40px" alt="" />
          <span
            v-if="getSidebarStat"
            class="mt-2 mx-3 position-fixed font-0 grow"
            >Sign Out</span
          >
        </div>
      </b-link>
    </div>
    <addItem />
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
import Alert from '../../helpers/swal'
import addItem from '../modals/AddItems'
import cart from '../modals/Cart'
export default {
  mixins: [Alert],
  components: {
    addItem,
    cart
  }
  ,
  data: () => {
    return {
    }
  },
  computed: {
    ...mapGetters({
      getSidebarStat: 'menu/getSidebar',
      getCart: 'menu/getCart',
      getUserdata: 'user/getUserdata',
      getPage: 'page/getPage'
    })
  },
  methods: {
    ...mapActions({
      getLogOut: 'user/logOut',
      pageSet: 'page/setPage'
    }),
    signOut () {
      this.alertQuestion('Are you sure?', 'Your session will destroyed').then(() => {
        this.toastSuccess(`Goodbye ${this.getUserdata.name}!`)
        this.getLogOut()
      })
    }
  }
}
</script>
