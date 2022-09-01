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
        {#if contacts.length > 0}
        <div class="flex flex-row pb-1 space-x-2 text-xs text-primary-content">            
            <a
                class="cursor"
                href="/patch-event?sort=name"
                on:click|preventDefault={() => sortBy('name')}
                class:font-bold={sort == 'name'}
                class:underline={sort != 'name'}
            >
                Name
                {#if sort == 'name'}
                ⬇️
                {/if}
            </a>
            <a
                class="cursor"
                href="/patch-event?sort=name"
                on:click|preventDefault={() => sortBy('created')}
                class:font-bold={sort == 'created'}
                class:underline={sort != 'created'}
            >
                Created
                {#if sort == 'created'}
                ⬇️
                {/if}
            </a>
        </div>
        {/if}
        {#each contacts as contact (contact.id)}
            <button
                class="mb-2 btn btn-primary"
                on:click={() => goto(`/patch-event?contact=${contact.id}&sort=${sort}`)}
            >
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
