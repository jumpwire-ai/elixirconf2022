<script>
    import Contact from "./Contact.svelte"
    export let contacts, request
    let form
    let formResult = ''

    function createContact() {
        const data = new FormData(form)
        request("create", Object.fromEntries(data.entries()), (result) => {
            if(result?.success) {
                form.reset()
                formResult = 'Contact created'
            } else if (result?.reason) {
                formResult = `Error creating contact: ${result.reason}`
            } else {
                formResult = 'An unknown error has occurred'
            }
        })
    }

</script>

<form bind:this={form} on:submit|preventDefault={createContact}>
    <label for="name">Name</label>
    <input type="text" name="name" />
    <label for="company">Company</label>
    <input type="text" name="company" />
    <label for="title">Title</label>
    <input type="text" name="title" />
    <label for="event">Event</label>
    <input type="text" name="event" />
    <p>{formResult}</p>
    <input type="submit" name="submit" value="Submit" />
</form>

{#each contacts as contact (contact.id)}
    <Contact {contact} />
{/each}