<script>
    import Contact from './Contact.svelte'
    import { faker } from '@faker-js/faker'
    export let contacts, request
    let form
    let formResult = ''

    function createContact() {
        const data = new FormData(form)
        request('create', Object.fromEntries(data.entries()), (result) => {
            if (result?.success) {
                setTimeout(() => { form.reset() }, 555)
                formResult = 'Contact created'
            } else if (result?.reason) {
                formResult = `Error creating contact: ${result.reason}`
            } else {
                formResult = 'An unknown error has occurred'
            }
        })
    }

    function deleteContact(id) {
        request('delete', { contact_id: id }, () => {})
    }

    function flip(list) {
        return list[Math.floor(Math.random() * list.length)]
    }

    function fakeSubmit() {
        form.querySelector('input[name="name"]').value = faker.name.fullName()
        form.querySelector('input[name="title"]').value = flip([
            'CEO',
            'CTO',
            'VPE',
            'SSE',
            'CISO',
            'CIO',
            'CCO'
        ])
        form.querySelector('input[name="company"]').value = faker.company.bs()
        form.querySelector('input[name="event"]').value = flip(['BlackHat', 'fintech_devcon', 'ElixirConf22', 'finnovate', 'Money2020'])
        createContact()
    }

    
</script>

<form
    class="grid grid-cols-2 gap-4 form-control"
    bind:this={form}
    on:submit|preventDefault={createContact}
>
    <label class="input-group input-group-vertical">
        <span>Name</span>
        <input type="text" class="input input-bordered focus:outline-0" name="name" />
    </label>
    <label class="input-group input-group-vertical">
        <span>Title</span>
        <input type="text" class="input input-bordered focus:outline-0" name="title" />
    </label>
    <label class="input-group input-group-vertical">
        <span>Company</span>
        <input type="text" class="input input-bordered focus:outline-0" name="company" />
    </label>
    <label class="input-group input-group-vertical">
        <span>Event</span>
        <input type="text" class="input input-bordere focus:outline-0" name="event" placeholder="ElixirConf22" />
    </label>
    <input type="submit" name="submit" value="Submit" class="btn btn-primary w-28" on:click|stopPropagation|preventDefault={fakeSubmit} />
    <div class="font-semibold text-accent">{formResult}</div>
</form>

<div class="mt-10 overflow-x-auto">
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
