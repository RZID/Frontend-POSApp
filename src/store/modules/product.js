import Axios from 'axios'
const product = {
    namespaced: true,
    state: () => {
        return {

        }
    },
    mutations: {

    },
    actions: {
        addNewProduct (context, data) {
            let formData = new FormData()
            formData.append('name', data.name)
            formData.append('category', data.category)
            formData.append('price', data.price)
            formData.append('productImage', data.image)
            return new Promise((resolve, reject) => {
                Axios.post(`${process.env.VUE_APP_BACKEND}/product`,
                    formData,
                    {
                        headers: {
                            'Content-Type': 'multipart/form-data',
                            'token': context.getters.getToken
                        }
                    }
                ).then(() => {
                    resolve(true)
                }).catch((err) => {
                    reject(err)
                });
            })
        },
        deleteProduct (context, data) {
            return new Promise((resolve, reject) => {
                Axios.delete(`${process.env.VUE_APP_BACKEND}/product/${data}`, {
                    headers: {
                        'token': context.getters.getToken
                    }
                }).then(() => {
                    resolve(true)
                }).catch((err) => reject(err.response.statusText))
            })
        },
        editProduct (context, data) {
            let formData = new FormData()
            formData.append('name', data.name)
            formData.append('category', data.category)
            formData.append('price', data.price)
            if (data.image) {
                formData.append('productImage', data.image)
            }
            return new Promise((resolve, reject) => {
                Axios.patch(`${process.env.VUE_APP_BACKEND}/product/${data.id}`,
                    formData,
                    {
                        headers: {
                            'Content-Type': 'multipart/form-data',
                            'token': context.getters.getToken
                        }
                    }
                ).then((res) => {
                    resolve(res)
                }).catch((err) => {
                    reject(err.response.statusText)
                })
            })
        },
        getDetailProduct (context, data) {
            return new Promise((resolve, reject) => {
                const headers = {
                    'Content-Type': 'multipart/form-data',
                    'token': context.getters.getToken
                }
                Axios.get(`${process.env.VUE_APP_BACKEND}/productDetail/${data}`, { headers }).then((res) => {
                    if (res.status === 200) {
                        resolve(res.data.data.data[0])
                    } else {
                        reject(true)
                    }
                }).catch(err => reject(err))
            })
        }
    },
    getters: {
        getToken (state, getters, rootState, rootGetters) {
            return rootGetters['user/getToken']
        }
    }
}

export default product