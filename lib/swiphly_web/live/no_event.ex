defmodule SwiphlyWeb.NoEvent do
  use SwiphlyWeb, :live_view

  alias Swiphly.Visitors

  require Logger

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:contacts, Visitors.list_contacts())

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
      <.live_component module={SwiphlyWeb.SvelteComponent} id="contacts" name="NoEvent" props={%{contacts: @contacts}} />
    """
  end
end
