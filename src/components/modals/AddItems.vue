<template>
  <div>
    <b-modal id="addItem" title="Add Item" hide-footer>
      <form action="" @submit.prevent="addItem()">
        <div class="form-group">
          <div class="row mb-3">
            <div class="col-3 d-flex">
              <div class="align-self-center">
                <p class="m-0">Name</p>
              </div>
            </div>
            <div class="col">
              <input
                type="text"
                v-model="form.name"
                class="form-control"
                required
              />
            </div>
          </div>
          <div class="row mb-3">
            <div class="col-3 d-flex">
              <div class="align-self-center">
                <p class="m-0">Image</p>
              </div>
            </div>
            <div class="col">
              <div class="row no-gutters">
                <div class="col-4 d-flex">
                  <div class="align-self-center">
                    <input
                      @change="sendFile($event)"
                      type="file"
                      accept="image/jpeg, image/png"
                      id="gotoFileMd"
                      style="display: none"
                    />
                    <button
                      type="button"
                      class="btn btn-block btn-primary2"
                      onclick="document.getElementById('gotoFileMd').click();"
                    >
                      <span v-if="!imageURLMd"> Upload </span>
                      <span v-else> Change </span>
                    </button>
                    <button
                      v-if="imageURLMd"
                      type="button"
                      class="btn btn-block btn-red"
                      @click="delFile()"
                    >
                      Remove
                    </button>
                  </div>
                </div>
                <div v-if="imageURLMd" class="col">
                  <div
                    class="w-100 m-h-10 img-thumbnail div-center-img"
                    :style="'background-image:url(' + imageURLMd + ')'"
                  ></div>
                </div>
              </div>
            </div>
          </div>
          <div class="row mb-3">
            <div class="col-3 d-flex">
              <div class="align-self-center">
                <p class="m-0">Price</p>
              </div>
            </div>
            <div class="col">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="basic-addon1">Rp.</span>
                </div>
                <input
                  type="text"
                  class="form-control"
                  v-model="form.price"
                  v-rupiah
                  required
                />
              </div>
            </div>
          </div>
          <div class="row mb-3">
            <div class="col-3 d-flex">
              <div class="align-self-center">
                <p class="m-0">Category</p>
              </div>
            </div>
            <div class="col">
              <select class="custom-select" v-model="form.category" required>
                <option
                  v-for="(element, i) in category"
                  :key="i"
                  :value="element.id_category"
                >
                  {{ element.name_category }}
                </option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col"></div>
          <div class="col">
            <div class="row">
              <div class="col">
                <button
                  type="button"
                  class="btn btn-block btn-red"
                  @click="$bvModal.hide('addItem')"
                >
                  Cancel
                </button>
              </div>
              <div class="col">
                <button type="submit" class="btn btn-block btn-primary2">
                  Add
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </b-modal>
  </div>
</template>
<script>
import Axios from 'axios'
import { mapGetters, mapActions } from 'vuex'
import Alert from '../../helpers/swal'
import Currency from '../../helpers/currency'
export default {
  mixins: [Alert, Currency],
  data: () => {
    return {
      form: {
        image: '',
        name: '',
        price: null,
        category: 1
      },
      imageURLMd: '',
      category: []
    }
  },
  computed: {
    ...mapGetters({
      getToken: 'user/getToken',
      getPage: 'page/getPage'
    })
  },
  methods: {
    ...mapActions({
      addNewProduct: 'product/addNewProduct',
      setProduct: 'menu/setProduct',
      setPage: 'page/setPage'
    }),
    addItem () {
      this.form.price = this.form.price.toString().split('.').join('')
      this.addNewProduct(this.form).then(() => {
        this.setProduct()
        this.setPage(1)
        this.form = {}
        this.imageURLMd = ''
        this.toastSuccess('Success! New product added')
        this.$bvModal.hide('addItem')
      }).catch(err => {
        this.toastAlert(err)
      })
    },
    sendFile (event) {
      const file = event.target.files[0]
      this.imageURLMd = URL.createObjectURL(file)
      this.form.image = file
    },
    delFile () {
      this.imageURLMd = ''
      this.form.image = ''
    },
    getCategory () {
      Axios.get(`${process.env.VUE_APP_BACKEND}/category`, {
        headers: {
          'token': this.getToken
        }
      }).then(res => {
        this.category = res.data.data.data
      })
    }
  },
  mounted () {
    this.getCategory()
  }
}
</script>
