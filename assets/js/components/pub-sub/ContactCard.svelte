<script>
    export let contact
</script>

<div class="card w-96 shadow-xl m-auto bg-secondary-200">
  <div class="card-body">
    <h2 class="card-title">{contact.name}</h2>
    <p>{contact.name} is the {contact.title} at {contact.company}</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Meet them at {contact.event}</button>
    </div>
  </div>
</div>