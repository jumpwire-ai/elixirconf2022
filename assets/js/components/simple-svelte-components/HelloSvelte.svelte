<script>
    import Nested from './Nested.svelte'
    export let content
</script>

<div class="shadow rounded-3xl p-2 ml-2 bg-secondary-100">
    <p>This is {content}, in a silly font.</p>
    <Nested />
</div>

<style>
    p {
        color: purple;
        font-family: 'Comic Sans MS', cursive;
        font-size: 2em;
    }
</style>
