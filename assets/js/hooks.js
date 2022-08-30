import HelloWorld from "./components/HelloWorld.svelte"

const components = {
  HelloWorld
}

function parsedProps(el) {
    const props = el.getAttribute('data-props')
    return props ? JSON.parse(props) : {}
}

const SvelteComponent = {
    async mounted() {
        const componentName = this.el.getAttribute('data-name')
        if (!componentName) {
            throw new Error('Component name must be provided')
        }

        const requiredApp = components[componentName]
        if (!requiredApp) {
            throw new Error(`Unable to find ${componentName} component`)
        }

        const pushEvent = (event, data, callback) => {
            // Always send to the LiveComponent instead of the parent LiveView
            this.pushEventTo(this.el, event, data, callback)
        }

        const goto = (href) => {
            liveSocket.pushHistoryPatch(href, "push", this.el)
        }

        this._instance = new requiredApp({
            target: this.el,
            props: {...parsedProps(this.el), pushEvent, goto },
        })
    },

    updated() {
        const pushEvent = (event, data, callback) => {
            // Always send to the LiveComponent instead of the parent LiveView
            this.pushEventTo(this.el, event, data, callback)
        }

        const goto = (href) => {
            liveSocket.pushHistoryPatch(href, "push", this.el)
        }

        this._instance.$$set({...parsedProps(this.el), pushEvent, goto })
    },

    destroyed() {
        this._instance?.$destroy()
    }
}

export default {
    SvelteComponent,
}