import Swal from 'sweetalert2'
import router from '../router/index'
import { mapGetters } from 'vuex'
const swal = {
    computed: {
        ...mapGetters({
            getUserdata: 'user/getUserdata'
        })
    },
    methods: {
        toastDanger: (message) => {
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 5000,
                background: '#bb2124',
                iconColor: '#ffffff',
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })
            Toast.fire({
                icon: 'error',
                title: `<span class="text-light">OOPs... ${message}</span>`,
            })
        },
        toastSuccess (message) {
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 5000,
                background: '#0d4065',
                iconColor: '#ffffff',
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })
            Toast.fire({
                icon: 'success',
                title: `<span class="text-light">${message}</span>`,
            })
        },
        toastLogin: (message) => {
            let timerInterval
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                background: '#0d4065',
                iconColor: '#ffffff',
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })
            Toast.fire({
                icon: 'success',
                title: `<span class="text-white">${message}</span>`,
                html: '<span class="text-white">Redirecting you in <b></b>s.</span>',
                timer: 2000,
                timerProgressBar: true,
                didOpen: () => {
                    timerInterval = setInterval(() => {
                        const content = Swal.getContent()
                        if (content) {
                            const b = content.querySelector('b')
                            if (b) {
                                b.textContent = (Swal.getTimerLeft() / 1000).toFixed()
                            }
                        }
                    }, 100)
                },
                willClose: () => {
                    clearInterval(timerInterval)
                }
            }).then((result) => {
                /* Read more about handling dismissals below */
                if (result.dismiss === Swal.DismissReason.timer) {
                    router.push('/menu')
                }
            })
        },
        alertQuestion (message, desc) {
            return new Promise((resolve) => {
                Swal.fire({
                    icon: 'question',
                    title: message,
                    text: desc,
                    showCancelButton: true,
                    confirmButtonText: `Sure!`,
                    denyButtonText: `Cancel`,
                }).then((result) => {
                    if (result.isConfirmed) {
                        resolve(true)
                    }
                })
            })
        }
    }

}
export default swal