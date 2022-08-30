<script>
    import Contact from './Contact.svelte'
    export let contacts, request
    let form
    let formResult = ''

    console.log("CONTACTS", contacts)

    function createContact() {
        const data = new FormData(form)
        request('create', Object.fromEntries(data.entries()), (result) => {
            if (result?.success) {
                form.reset()
                formResult = 'Contact created'
            } else if (result?.reason) {
                formResult = `Error creating contact: ${result.reason}`
            } else {
                formResult = 'An unknown error has occurred'
            }
        })
    }

    function deleteContact(id) {
        request('delete', {contact_id: id}, () => {})
    }
</script>

<form
    class="form-control grid grid-cols-2 gap-4"
    bind:this={form}
    on:submit|preventDefault={createContact}
>
    <label class="input-group input-group-vertical">
        <span>Name</span>
        <input type="text" class="input input-bordered" name="name" />
    </label>
    <label class="input-group input-group-vertical">
        <span>Title</span>
        <input type="text" class="input input-bordered" name="title" />
    </label>
    <label class="input-group input-group-vertical">
        <span>Company</span>
        <input type="text" class="input input-bordered" name="company" />
    </label>
    <label class="input-group input-group-vertical">
        <span>Event</span>
        <input type="text" class="input input-bordered" name="event" placeholder="ElixirConf22" />
    </label>
    <input type="submit" name="submit" value="Submit" class="btn btn-primary w-28" />
    <div class="font-semibold text-accent">{formResult}</div>
</form>

<div class="overflow-x-auto mt-10">
    <table class="table w-full">
        <!-- head -->
        <thead>
            <tr>
                <th />
                <th>Name</th>
                <th>Title</th>
                <th>Company</th>
                <th>Event</th>
                <th />
            </tr>
        </thead>
        <tbody>
            {#each contacts as contact (contact.id)}
                <Contact {contact} del={deleteContact} />
            {:else}
                <tr>
                    <th />
                    <th class="italic">No contacts!</th>
                    <th />
                    <th />
                    <th />
                </tr>
            {/each}
        </tbody>
    </table>
</div>
