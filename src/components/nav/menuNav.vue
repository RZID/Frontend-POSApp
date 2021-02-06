<template>
  <div class="m-0 navbar-top d-flex w-100 shadow">
    <div class="row no-gutters align-self-center w-100">
      <div class="col-0-5 text-center">
        <button class="btn" @click="toggleSidebar()">
          <h3 class="m-0"><i class="uil uil-bars"></i></h3>
        </button>
      </div>
      <div class="col text-center d-flex">
        <div class="row no-gutters align-self-center w-100 d-flex">
          <div class="align-self-center col">
            <h4 class="m-0">Food Items</h4>
          </div>
          <div class="align-self-center col-0-5">
            <b-link class="text-dark" @click="filterBar()">
              <h3 class="m-0 text-center">
                <i class="uil uil-search"></i>
              </h3>
            </b-link>
          </div>
        </div>
      </div>
      <div class="d-none text-center d-md-flex col-md-4">
        <h4 class="m-0 align-self-center w-100">
          Cart
          <span class="badge btn-primary2">{{ getCart.length }}</span>
        </h4>
      </div>
    </div>
  </div>
</template>
<script>
import { mapActions, mapGetters } from 'vuex'
export default {
  computed: {
    ...mapGetters({
      getSidebarStat: 'menu/getSidebar',
      getCart: 'menu/getCart'
    })
  },
  methods: {
    ...mapActions({
      setProduct: 'menu/setProduct',
      setSidebar: 'menu/setSidebar',
      setFilterBar: 'menu/setFilterBar'
    }),
    toggleSidebar () {
      this.setSidebar()
    },
    filterBar () {
      this.setProduct()
      this.setFilterBar()
    }
  }
}
</script>
