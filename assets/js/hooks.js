import HelloSvelte from "./components/simple-svelte-components/HelloSvelte.svelte"
import Contacts from "./components/push-event/Contacts.svelte"

const components = {
  HelloSvelte,
  Contacts
}

function parsedProps(el) {
    const props = el.getAttribute('data-props')
    return props ? JSON.parse(props) : {}
}

const SvelteComponent = {
    mounted() {
        const componentName = this.el.getAttribute('data-name')
        if (!componentName) {
            throw new Error('Component name must be provided')
        }

        const requiredApp = components[componentName]
        if (!requiredApp) {
            throw new Error(`Unable to find ${componentName} component. Did you forget to import it into hooks.js?`)
        }

        const request = (event, data, callback) => {
            this.pushEvent(event, data, callback)
        }

        const goto = (href) => {
            liveSocket.pushHistoryPatch(href, "push", this.el)
        }

        this._instance = new requiredApp({
            target: this.el,
            props: {...parsedProps(this.el), request, goto },
        })
    },

    updated() {
        const request = (event, data, callback) => {
            this.pushEvent(event, data, callback)
        }

        const goto = (href) => {
            liveSocket.pushHistoryPatch(href, "push", this.el)
        }

        this._instance.$$set({...parsedProps(this.el), request, goto })
    },

    destroyed() {
        this._instance?.$destroy()
    }
}

export default {
    SvelteComponent,
}