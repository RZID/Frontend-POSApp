<template>
  <div>
    <GChart type="LineChart" :data="chartData" :options="chartOptions" />
  </div>
</template>
<script>
import Vue from 'vue'
import VueGoogleCharts from 'vue-google-charts'
Vue.use(VueGoogleCharts)
import { GChart } from 'vue-google-charts'

export default {
  data () {
    return {
      chartData: [
        ['Week', 'This Week', 'Last Week'],
        ['Week 1', 300000, 400000],
        ['Week 2', 400000, 500000],
        ['Week 3', 500000, 250000],
        ['Week 4', 120000, 300000]
      ],
      chartOptions: {
        chart: {
          title: 'This Week',
          subtitle: 'Sales, Expenses, and Profit: 2014-2017',
        }
      }
    }
  },
  components: {
    GChart
  }
}
</script>
