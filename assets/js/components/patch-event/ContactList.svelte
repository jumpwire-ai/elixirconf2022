<script>
    import ContactCard from './ContactCard.svelte'
    import EmptyContactCard from './EmptyContactCard.svelte'
    export let contacts, selected, sort, goto

    function sortBy(order) {
        url = selected
            ? `/patch-event?contact=${selected.id}&sort=${order}`
            : `/patch-event?sort=${order}`
        goto(url)
    }

    console.log('SELECTED', selected)
</script>

<div class="grid grid-cols-5 space-x-4 pl-4">
    <div>
        <div class="flex flex-row text-sm space-x-2 text-secondary-700 pb-1">
            <div>Sort by:</div>
            <a
                class="cursor underline"
                href="/patch-event?sort=name"
                on:click|preventDefault={() => sortBy('name')}
                class:font-bold={sort == 'name'}
            >
                Name
            </a>
            <a
                class="cursor underline"
                href="/patch-event?sort=name"
                on:click|preventDefault={() => sortBy('created')}
                class:font-bold={sort == 'created'}
            >
                Created
            </a>
        </div>
        <ul class="divide-y-2 border border-primary-200 rounded-sm">
            {#each contacts as contact (contact.id)}
                <li
                    class="cursor-pointer"
                    on:click={() => goto(`/patch-event?contact=${contact.id}&sort=${sort}`)}
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
