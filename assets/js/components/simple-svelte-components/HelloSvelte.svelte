<script>
	import Nested from './Nested.svelte';
	export let content;
</script>

<style>
	p {
		color: purple;
		font-family: 'Comic Sans MS', cursive;
		font-size: 2em;
	}
</style>

<p>This is {content}, in a silly font.</p>
<Nested/>
This code was taken from <a href="https://svelte.dev/tutorial/nested-components">Svelte's tutorial introduction</a>