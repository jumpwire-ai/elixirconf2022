# elixirconf2022
Code examples for ElixirConf 2022 talk on using Svelte with Phoenix LiveView.

This project is built with the following components:
- Phoenix v1.6.11
- Svelte v3.49.0
- npm modules tailwindcss, postcss, autoprefixier, esbuild-style-plugin, daisyui, esbuild-svelte

# This project
Someone once said there are three hard things in programming -
1. Naming
2. Off-by-one errors

Fortunately, we're more clever than that.
Let's call this Phoenix app **S**velte **wi**th **ph**oenix, serious**ly**. 

## Initial setup

We initialized this code repository with the following commands. If you clone this repo, you can skip these steps, but when starting from scratch, create a new Phoenix app in an empty directory (`.` after `phx.new` indicates current directory).
```
mix phx.new . --app swiphly --database sqlite3
```
> note: if you are starting from scratch and getting an error with sqlite3, you might need to update your phx\_new app:
`mix archive.install hex phx_new`

We will be using an esbuild plugin to build Svelte and Tailwindcss components.
Modify the Phoenix app to support esbuild plugins, bypassing the default configuration of esbuild (via the Elixir wrapper).
Follow instructions here to alter the generated scaffold - https://hexdocs.pm/phoenix/asset_management.html#esbuild-plugins

### Node modules
This application uses the following node dependences during `esbuild`
```
npm install esbuild svelte tailwindcss postcss autoprefixer esbuild-svelte esbuild-style-plugin daisyui @faker-js/faker --save-dev
npm install ../deps/phoenix ../deps/phoenix_html ../deps/phoenix_live_view --save
```

### Ecto tables
The following database tables are defined used by this application:
```
mix phx.gen.context Visitors Contact contacts name:string title:string company:string event:string
mix phx.gen.context Visitors Chat chats contact_id:integer message:string
```

### Running
To run a Phoenix server with an interactive shell, use the following command:
```
iex -S mix phx.server
```

### Resources
https://hexdocs.pm/phoenix/asset_management.html#esbuild-plugins
https://hexdocs.pm/phoenix_live_view/Phoenix.LiveComponent.html
https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#attach_hook/4
https://github.com/EMH333/esbuild-svelte
https://svelte.dev/tutorial/


Steps
- Initial setup of Phoenix project
- (Update Phoenix to use self-defined esbuild, so we can add plugins for building svelte into the esbuild pipeline)
- (Install npm dev dependecies)
- Create custom phoenix-live JS hook that integrates live-component lifecycle with Svelte lifecycle
- Create a live component to wrap div with encoded props and phx-hook bootstrapping a Svelte component in JS
- Build live-views to update server state from params and events