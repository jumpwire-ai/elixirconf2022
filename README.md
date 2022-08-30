# elixirconf2022
Code examples for ElixirConf 2022 talk on using Svelte with Phoenix LiveView.

This project is built with the following components:
- Phoenix v1.6.11
- 


## Initial setup

Someone once said there are three hard things in programming -
1. Naming
2. Off-by-one errors

Fortunately, we're more clever than that.
Let's call this Phoenix app **S**velte **wi**th **ph**oenix, serious**ly**. 

### From scartch
We initialized this code repository with the following commands. If you clone this repo, you can skip these steps, but when starting from scratch, create a new Phoenix app in an empty directory (`.` after `phx.new` indicates current directory).
```
mix phx.new . --app swiphly --database sqlite3
```
note: if you are starting from scratch and getting an error with sqlite3, you might need to update your phx\_new app:
```
mix archive.install hex phx_new
```

We will be using an esbuild plugin to build Svelte components.
Modify the Phoenix app to support esbuild plugins, default configuration of esbuild (via the Elixir wrapper).
More details here - https://hexdocs.pm/phoenix/asset_management.html#esbuild-plugins


Steps
- Initial setup of Phoenix project
- Update Phoenix to use self-defined esbuild, so we can add plugins for building svelte into the esbuild pipeline
- Install npm dev dependecies (esbuild, svelte, esbuild-svelte)
- Create a live component to wrap div with encoded props and phx-hook bootstrapping a Svelte component in JS