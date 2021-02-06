<template>
  <div class="m-0 navbar-top d-flex w-100 shadow">
    <div class="row no-gutters align-self-center w-100">
      <div class="col-0-5 text-center">
        <button class="btn" @click="toggleSidebar()">
          <h3 class="m-0"><i class="uil uil-bars"></i></h3>
        </button>
      </div>
      <div class="col d-flex justify-content-center">
        <div class="align-self-center">
          <h4 class="m-0">Detail Item</h4>
        </div>
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
    filterBar () {
      this.setProduct()
      this.setFilterBar()
    },
    toggleSidebar () {
      this.setSidebar()
    }
  }
}
</script>
