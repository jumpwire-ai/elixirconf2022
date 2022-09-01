<script>
    import ContactCard from './ContactCard.svelte'
    import EmptyContactCard from './EmptyContactCard.svelte'
    export let contacts
    let selected = null
    let sort = "name"

    function sortContacts(s) {
        return contacts.sort((a, b) => a[s].localeCompare(b[s]))
    }

    $: sortedContacts = sortContacts(sort)
</script>

<div class="grid grid-cols-5 pl-4 space-x-4">
    <div>
        {#if contacts.length > 0}
        <div class="flex flex-row pb-1 space-x-2 text-xs text-primary-content">
            <button
                class="cursor"
                on:click|preventDefault={() => sort = 'name'}
                class:font-bold={sort == 'name'}
                class:underline={sort != 'name'}
            >
                Name
                {#if sort == 'name'}
                ⬇️
                {/if}
            </button>
            <button
                class="cursor"
                on:click|preventDefault={() => sort = 'inserted_at'}
                class:font-bold={sort == 'inserted_at'}
                class:underline={sort != 'inserted_at'}
            >
                Created
                {#if sort == 'inserted_at'}
                ⬇️
                {/if}
            </button>
        </div>
        {/if}
        {#each sortedContacts as contact (contact.id)}
            <button class="mb-2 btn btn-primary text-primary-content" on:click={() => selected = contact}>
                {contact.name}
            </button>
            <br />
        {:else}
            <span class="italic font-bold text-primary-content">No contacts!</span>
        {/each}
    </div>
    <div class="col-span-4 align-middle">
        {#if selected}
            <ContactCard contact={selected} />
        {:else if contacts.length > 0}
            <EmptyContactCard />
        {/if}
    </div>
</div>
