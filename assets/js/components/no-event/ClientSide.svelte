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
        <div class="flex flex-row pb-1 space-x-2 text-sm text-secondary-700">
            <div>Sort by:</div>
            <button
                class="underline cursor"
                on:click|preventDefault={() => sort = 'name'}
                class:font-bold={sort == 'name'}
            >
                Name
            </button>
            <button
                class="underline cursor"
                on:click|preventDefault={() => sort = 'inserted_at'}
                class:font-bold={sort == 'inserted_at'}
            >
                Created
            </button>
        </div>
        <ul class="border divide-y-2 rounded-sm border-primary-200">
            {#each sortedContacts as contact (contact.id)}
                <li
                    class="cursor-pointer"
                    on:click={() => selected = contact}
                >
                    <button class="btn btn-link">{contact.name}</button>
                </li>
            {:else}
                <li>No contacts!</li>
            {/each}
        </ul>
    </div>
    <div class="col-span-4 align-middle">
        {#if selected}
            <ContactCard contact={selected} />
        {:else}
            <EmptyContactCard />
        {/if}
    </div>
</div>
