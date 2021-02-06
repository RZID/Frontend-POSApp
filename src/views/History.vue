<template>
  <div class="h-100">
    <navBar />
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
      <div class="col height-min-nav overflow-auto"></div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import sideBar from '../components/nav/sideBar'
import navBar from '../components/nav/historyNav'
export default {
  components: {
    sideBar, navBar
  }, computed: {
    ...mapGetters({
      getSidebar: 'menu/getSidebar',
      getToken: 'user/getToken'
    })
  }
}
</script>
