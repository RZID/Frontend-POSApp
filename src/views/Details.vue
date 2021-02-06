<template>
  <div class="h-100">
    <detailNav />
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
          <div class="card my-5">
            <div class="row no-gutters">
              <div class="col-md-4">
                <div
                  v-if="data.image"
                  :style="
                    'background-image:url(' +
                    backend +
                    '/image/' +
                    data.image +
                    ')'
                  "
                  class="h-100 div-center-img"
                  alt="..."
                ></div>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <div class="row my-3">
                    <div class="col-4 d-flex">
                      <h5 class="align-self-end">Name</h5>
                    </div>
                    <div class="col">
                      <input
                        v-model="data.name"
                        type="text"
                        class="form-control"
                        aria-describedby="emailHelp"
                      />
                    </div>
                  </div>
                  <div class="row my-3">
                    <div class="col-4 d-flex">
                      <h5 class="align-self-end">Price</h5>
                    </div>
                    <div class="col">
                      <input
                        v-model="data.price"
                        type="number"
                        class="form-control"
                        aria-describedby="emailHelp"
                      />
                    </div>
                  </div>
                  <div class="row my-3">
                    <div class="col-4 d-flex">
                      <h5 class="align-self-end">Image</h5>
                    </div>
                    <div class="col">
                      <div class="row no-gutters">
                        <div class="col-4 d-flex">
                          <div class="align-self-center">
                            <input
                              @change="sendFile($event)"
                              type="file"
                              accept="image/jpeg, image/png"
                              id="gotoFile"
                              style="display: none"
                            />
                            <button
                              type="button"
                              class="btn btn-block btn-primary2"
                              onclick="document.getElementById('gotoFile').click();"
                            >
                              <span v-if="!imageURL"> Upload </span>
                              <span v-else> Change </span>
                            </button>
                            <button
                              v-if="imageURL"
                              type="button"
                              class="btn btn-block btn-red"
                              @click="delFile()"
                            >
                              Remove
                            </button>
                          </div>
                        </div>
                        <div v-if="imageURL" class="col">
                          <div
                            class="w-100 m-h-10 img-thumbnail div-center-img"
                            :style="'background-image:url(' + imageURL + ')'"
                          ></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row my-3">
                    <div class="col-4 d-flex">
                      <h5 class="align-self-end">Category</h5>
                    </div>
                    <div class="col">
                      <select
                        class="custom-select"
                        v-model="data.category_id"
                        required
                      >
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
                  <div class="text-right">
                    <button class="btn btn-red mr-2" @click="deleteNow()">
                      Delete Product
                    </button>
                    <button class="btn btn-primary2" @click="editNow()">
                      Edit Data
                    </button>
                  </div>
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
import sideBar from '../components/nav/sideBar'
import detailNav from '../components/nav/detailNav'
import Axios from 'axios'
import Alert from '../helpers/swal'
export default {
  components: {
    sideBar, detailNav
  },
  mixins: [Alert],
  data: () => {
    return {
      data: {},
      backend: process.env.VUE_APP_BACKEND,
      category: [],
      imageSet: false,
      imageURL: '',
      rawImage: null
    }
  },
  methods: {
    ...mapActions({
      getDetail: 'product/getDetailProduct',
      editProduct: 'product/editProduct',
      deleteProduct: 'product/deleteProduct'
    }),
    getCategory () {
      Axios.get(`${process.env.VUE_APP_BACKEND}/category`, {
        headers: {
          'token': this.getToken
        }
      }).then(res => {
        this.category = res.data.data.data
      })
    },
    sendFile (event) {
      const file = event.target.files[0];
      this.imageURL = URL.createObjectURL(file);
      this.rawImage = file
      this.imageSet = true
    },
    delFile () {
      this.imageURL = ''
      this.rawImage = null
      this.imageSet = false
    },
    deleteNow () {
      this.alertQuestion('Delete this product?', 'This product no longer exist in menu!').then(() => {
        this.deleteProduct(this.data.id).then(() => {
          this.toastSuccess(`${this.data.name} was deleted!`)
          this.$router.push('/')
        }).catch((err) => this.toastDanger(err))
      })
    },
    editNow () {
      let sendData = ''
      if (this.imageSet) {
        sendData = {
          id: this.$route.params.id,
          name: this.data.name,
          price: this.data.price,
          category: this.data.category_id,
          image: this.rawImage
        }
      } else {
        sendData = {
          id: this.$route.params.id,
          name: this.data.name,
          price: this.data.price,
          category: this.data.category_id
        }
      }
      this.editProduct(sendData).then(() => {
        this.data = ''
        this.getDetail(this.$route.params.id).then(res => {
          this.data = res
          this.toastSuccess('Data was updated!')
        })
      }).catch((err) => this.toastDanger(err))
    }
  },
  computed: {
    ...mapGetters({
      getSidebar: 'menu/getSidebar',
      getToken: 'user/getToken'
    })
  },
  mounted () {
    this.getCategory()
    this.getDetail(this.$route.params.id).then(res => {
      this.data = res
    }).catch(() => this.$router.push('/'))
  }
}
</script>
