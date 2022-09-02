<script>
    import ContactChat from './ContactChat.svelte'
    import EmptyContactChat from './EmptyContactChat.svelte'
    export let contacts, last_chat, request
    let form

    function createMessage() {
        form.querySelector('input[name="contact_id"]').value =
            contacts[Math.floor(Math.random() * (contacts.length - 1))].id
        const data = new FormData(form)
        request('create', Object.fromEntries(data.entries()), (result) => {
            if (result?.success) {
                form.reset()
            } else if (result?.reason) {
                console.error(`Error creating contact: ${result.reason}`)
            } else {
                console.error('An unknown error has occurred')
            }
        })
    }

    function lookupContact(cid) {
        return contacts.find((c) => c.id == cid)
    }
</script>

<div class="ml-4">
    <form class="flex flex-row items-center justify-start space-x-4" bind:this={form} on:submit|preventDefault={createMessage}>
        <label class="w-80 input-group input-group-vertical">
            <span>Message</span>
            <input type="text" class="input input-bordered focus:outline-0" name="message" />
            <input type="hidden" name="contact_id" value="1" />
        </label>
        <input type="submit" name="submit" value="Submit" class="w-24 btn btn-primary" />
    </form>
</div>

<div class="m-4">
    {#if last_chat}
        <ContactChat contact={lookupContact(last_chat.contact_id)} chat={last_chat} />
    {:else}
        <EmptyContactChat />
    {/if}
</div>
