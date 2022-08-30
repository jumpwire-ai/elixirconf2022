defmodule SwiphlyWeb.SimpleSvelteComponent do
  use SwiphlyWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, content: "content from a socket assigns, loaded as a prop")}
  end

  def render(assigns) do
    ~H"""
      <.live_component module={SwiphlyWeb.SvelteComponent} id="hero" name="HelloSvelte" props={%{content: @content}} />
    """
  end
end
