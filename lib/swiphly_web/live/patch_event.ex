defmodule SwiphlyWeb.PatchEvent do
  use SwiphlyWeb, :live_view

  alias Swiphly.Visitors

  require Logger

  @impl true
  def mount(_params, _session, socket) do
    sort = "name"

    socket =
      socket
      |> assign(:contacts, sort_contacts(Visitors.list_contacts(), sort))
      |> assign(:selected, nil)
      |> assign(:sort, sort)

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
      <.live_component module={SwiphlyWeb.SvelteComponent} id="contacts" name="ContactList" props={%{contacts: @contacts, selected: @selected, sort: @sort}} />
    """
  end

  @impl true
  def handle_params(%{"contact" => contact_id, "sort" => sort}, _uri, socket) do
    {contact_id, _} = Integer.parse(contact_id)
    selected = Enum.find(socket.assigns.contacts, fn %{id: id} -> id == contact_id end)

    socket =
      socket
      |> assign(:contacts, sort_contacts(socket.assigns.contacts, sort))
      |> assign(:sort, sort)
      |> assign(:selected, selected)

    {:noreply, socket}
  end

  @impl true
  def handle_params(%{"contact" => contact_id}, _uri, socket) do
    {contact_id, _} = Integer.parse(contact_id)
    selected = Enum.find(socket.assigns.contacts, fn %{id: id} -> id == contact_id end)

    socket =
      socket
      |> assign(:selected, selected)

    {:noreply, socket}
  end

  @impl true
  def handle_params(%{"sort" => sort}, _uri, socket) do
    socket =
      socket
      |> assign(:contacts, sort_contacts(socket.assigns.contacts, sort))
      |> assign(:sort, sort)

    {:noreply, socket}
  end

  @impl true
  def handle_params(_params, _uri, socket) do
    socket =
      socket
      |> assign(:selected, nil)

    {:noreply, socket}
  end

  defp sort_contacts(contacts, sort) do
    case sort do
      "name" ->
        Enum.sort_by(contacts, & &1.name)

      "created" ->
        Enum.sort_by(contacts, & &1.inserted_at, DateTime)

      _ ->
        contacts
    end
  end
end
