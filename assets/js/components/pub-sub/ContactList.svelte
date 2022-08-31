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
</script>

<div class="grid grid-cols-5 pl-4 space-x-4">
    <div>
        <div class="flex flex-row pb-1 space-x-2 text-sm text-secondary-700">
            <div>Sort by:</div>
            <a
                class="underline cursor"
                href="/patch-event?sort=name"
                on:click|preventDefault={() => sortBy('name')}
                class:font-bold={sort == 'name'}
            >
                Name
            </a>
            <a
                class="underline cursor"
                href="/patch-event?sort=name"
                on:click|preventDefault={() => sortBy('created')}
                class:font-bold={sort == 'created'}
            >
                Created
            </a>
        </div>
        <ul class="border divide-y-2 rounded-sm border-primary-200">
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
