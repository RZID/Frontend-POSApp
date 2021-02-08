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
      <div class="col height-min-nav overflow-auto">
        <div class="container">
          <div class="row py-5">
            <div class="col-md py-md-0 pb-2" style="min-height: 175px">
              <div class="card h-100 card-1 border-0 shadow">
                <div class="card-body">
                  <div class="h-100 d-flex">
                    <div class="align-self-center">
                      <h6 class="m-0">Today's Income</h6>
                      <h3 class="m-0">{{ toRupiah(getTodayIncome) }}</h3>
                      <!-- <h6 class="m-0">{{ getPercentage.todayYesterday }}</h6> -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md py-md-0 pb-2" style="min-height: 175px">
              <div class="card h-100 card-2 border-0 shadow">
                <div class="card-body">
                  <div class="h-100 d-flex">
                    <div class="align-self-center">
                      <h6 class="m-0">Orders</h6>
                      <h3 class="m-0">{{ getOrders }}</h3>
                      <!-- <h6 class="m-0">{{ getPercentage.thisWeekLastWeek }}</h6> -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md py-md-0 pb-2" style="min-height: 175px">
              <div class="card h-100 card-3 border-0 shadow">
                <div class="card-body">
                  <div class="h-100 d-flex">
                    <div class="align-self-center">
                      <h6 class="m-0">This Year Income</h6>
                      <h3 class="m-0">{{ toRupiah(getYearIncome) }}</h3>
                      <!-- <h6 class="m-0">{{ getPercentage.thisYearLastYear }}</h6> -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card shadow">
            <div class="card-body">
              <div class="row">
                <div class="col">
                  <h4 class="m-0">Revenue</h4>
                </div>
                <div class="col-lg-3 col-5">
                  <div class="input-group">
                    <select
                      class="custom-select"
                      id="inputGroupSelect04"
                      aria-label="Example select with button addon"
                    >
                      <option selected>Month</option>
                      <option>Year</option>
                    </select>
                  </div>
                </div>
              </div>
              <chart />
            </div>
          </div>
          <div class="card shadow my-5">
            <div class="card-body">
              <div class="row">
                <div class="col">
                  <h4 class="m-0">Recent Order</h4>
                </div>
                <div class="col-lg-3 col-5">
                  <div class="input-group">
                    <select
                      class="custom-select"
                      id="inputGroupSelect04"
                      aria-label="Example select with button addon"
                      v-model="table"
                      @click="setTable(true)"
                    >
                      <option value="1">Today</option>
                      <option value="2">Yesterday</option>
                      <option value="3">Weeks</option>
                      <option value="4">Months</option>
                      <option value="5">Years</option>
                      <option value="6">All</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="py-2">
                <div v-if="!getStatusHistory">
                  <tableOrder :objOfData="getHistory" />
                  <b-pagination
                    v-model="currentPage"
                    :total-rows="getPageProp.filteredData"
                    :per-page="10"
                    @input="setTable()"
                  ></b-pagination>
                </div>
                <div v-else class="text-center">
                  <img src="/icons/nodata.png" width="300px" alt="" />
                  <h4>Ooops...</h4>
                  <p class="text-muted">
                    Showing No Data. Please change limiter on top-right selector
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapActions, mapGetters } from 'vuex'
import Moment from 'moment'
import chart from '../components/chart/index'
import sideBar from '../components/nav/sideBar'
import navBar from '../components/nav/historyNav'
import tableOrder from '../components/tables/orders'
import currency from '../helpers/currency'
export default {
  mixins: [currency],
  data: () => {
    return {
      table: '1',
      currentPage: 1
    }
  },
  components: {
    sideBar, navBar, chart, tableOrder
  }, computed: {
    ...mapGetters({
      getSidebar: 'menu/getSidebar',
      getToken: 'user/getToken',
      getHistory: 'history/getHistory',
      getStatusHistory: 'history/getStatusHistory',
      getPageProp: 'history/getPageProp',
      getTodayIncome: 'card/getTodayIncome',
      getOrders: 'card/getOrders',
      getYearIncome: 'card/getYearIncome',
      getPercentage: 'card/getPercentage'
    })
  },
  methods: {
    ...mapActions({
      setHistory: 'history/setHistory',
      setCard: 'card/setCartData'
    }),
    setTable (resetPage) {
      if (resetPage) {
        this.currentPage = 1
      }
      let betweenStart = ''
      let betweenEnd = Moment().endOf('day').unix()
      switch (this.table) {
        case '1':
          betweenStart = Moment().startOf('day').unix()
          break
        case '2':
          betweenStart = Moment().subtract(1, 'day').startOf('day').unix()
          break
        case '3':
          betweenStart = Moment().startOf('week').unix()
          break
        case '4':
          betweenStart = Moment().startOf('month').unix()
          break
        case '5':
          betweenStart = Moment().startOf('year').unix()
          break
        case '6':
          betweenStart = null
          betweenEnd = null
          break
      }
      const thisFilter = { betweenStart: betweenStart, betweenEnd: betweenEnd, page: this.currentPage }
      this.setHistory(thisFilter)
    }
  },
  mounted () {
    const betweenStart = Moment().startOf('day').unix()
    const betweenEnd = Moment().endOf('day').unix()
    const today = { betweenStart: betweenStart, betweenEnd: betweenEnd }
    this.setHistory(today)
    this.setCard()
  }
}
</script>
