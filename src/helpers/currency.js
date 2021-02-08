const currency = {
    methods: {
        toRupiah (number) {
            if (typeof (number) !== 'number') {
                number = parseInt(number)
            }
            return `Rp. ${number.toLocaleString('id-ID')},-`
        }
    },
    directives: {
        rupiah: {
            update: (el) => {
                if (el.value) {
                    el.value = parseInt((el.value).replace(/\D/g, "")).toLocaleString('id-ID')
                }
            }
        }
    }
}
export default currency