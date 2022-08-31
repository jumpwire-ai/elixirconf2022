<script>
    export let contact

    $: localDate = new Date(contact.inserted_at).toLocaleDateString('en-US',  {
        weekday: 'short',
        year: 'numeric',
        month: 'short',
        day: 'numeric',
        hour: 'numeric',
        minute: 'numeric'
    })
</script>

<div class="m-auto shadow-xl card w-96 bg-secondary-200">
  <div class="card-body">
    <h2 class="card-title">{contact.name}</h2>
    <span>Joined {localDate}</span>
    <p>{contact.name} is the {contact.title} at {contact.company}</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Meet them at {contact.event}</button>
    </div>
  </div>
</div>