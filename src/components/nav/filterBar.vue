<template>
  <div>
    <div v-if="getPageProp">
      <div class="container py-2">
        <div class="row">
          <div class="col">
            Search
            <input
              type="text"
              class="form-control form-control-sm"
              v-model="$parent.filtering.search"
              @input="$parent.goFilter(true)"
            />
          </div>
          <div class="col">
            Search By
            <select
              class="custom-select custom-select-sm"
              v-model="$parent.filtering.searchBy"
              @change="$parent.goFilter(true)"
            >
              <option value="name">Name</option>
              <option value="price">Price</option>
              <option value="category">Category</option>
            </select>
          </div>
          <div class="col-md">
            Sort
            <div class="input-group-sm input-group">
              <select
                class="custom-select"
                id="inputGroupSelect04"
                aria-label="Example select with button addon"
                v-model="$parent.filtering.sort"
                @change="$parent.goFilter(true)"
              >
                <option value="">Sort By...</option>
                <option value="name">Name</option>
                <option value="price">Price</option>
                <option value="category">Category</option>
              </select>
              <div class="input-group-append">
                <button
                  class="btn btn-outline-secondary"
                  type="button"
                  @click="changeMethod()"
                >
                  <span v-if="$parent.filtering.sortMethod === 'desc'">
                    <span class="m-0 font-weight-bold"
                      ><i class="uil uil-arrow-up"></i
                    ></span>
                  </span>
                  <span v-else>
                    <span class="m-0 font-weight-bold"
                      ><i class="uil uil-arrow-down"></i
                    ></span>
                  </span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  computed: {
    ...mapGetters({
      getPageProp: 'menu/getPage'
    })
  },
  methods: {
    ...mapActions({
      setProduct: 'menu/setProduct'
    }),
    changeMethod () {
      this.$parent.filtering.sortMethod === 'asc' ? this.$parent.filtering.sortMethod = 'desc' : this.$parent.filtering.sortMethod = 'asc'
      this.$parent.goFilter(true)
    }
  }
}
</script>
