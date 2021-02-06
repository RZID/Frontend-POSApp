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
              v-model="search"
              @input="goFilter(true)"
            />
          </div>
          <div class="col">
            Search By
            <select
              class="custom-select custom-select-sm"
              v-model="searchBy"
              @change="goFilter(true)"
            >
              <option value="name">Name</option>
              <option value="price">Price</option>
              <option value="category">Category</option>
            </select>
          </div>
        </div>
        <div class="mt-3">
          <div class="row">
            <div class="col">
              Page
              <b-pagination
                size="sm"
                v-model="currentPage"
                :total-rows="getPageProp.filteredData"
                :per-page="getPageProp.limit"
                @input="goFilter()"
              ></b-pagination>
            </div>
            <div class="col">
              Sort
              <div class="input-group-sm input-group">
                <select
                  class="custom-select"
                  id="inputGroupSelect04"
                  aria-label="Example select with button addon"
                  v-model="sort"
                  @change="goFilter(true)"
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
                    <span v-if="sortMethod === 'desc'">
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
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
import page from '../../helpers/page'
export default {
  mixins: [page],
  data: () => {
    return {
      search: '',
      searchBy: 'name',
      sort: '',
      sortMethod: 'asc'
    }
  },
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
      this.sortMethod === 'asc' ? this.sortMethod = 'desc' : this.sortMethod = 'asc'
      this.goFilter(true)
    },
    goFilter (resetPage) {
      if (resetPage) {
        this.currentPage = 1
      }
      const filter = {
        by: this.searchBy,
        like: this.search,
        order: this.sort,
        orderMethod: this.sortMethod,
        page: this.currentPage
      }
      this.setProduct(filter)
    }
  }
}
</script>
