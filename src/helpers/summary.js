const summary = {
    methods: {
        setProfit (one, two) {
            if (one > two) {
                return `+ ${one / two}`
            } else if (one === two) {
                return 'previous and current sales were the same'
            } else {
                return `- ${two / one}`
            }
        }
    }
}
export default summary