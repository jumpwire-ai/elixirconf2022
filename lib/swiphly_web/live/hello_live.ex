defmodule SwiphlyWeb.HelloLive do
  use SwiphlyWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, content: "Oh my! Oh me?")}
  end

  def render(assigns) do
    ~H"""
      <.live_component module={SwiphlyWeb.SvelteComponent} id="hero" name="HelloWorld" props={%{content: @content}} />
    """
  end
end
