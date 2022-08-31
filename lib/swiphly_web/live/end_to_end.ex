defmodule SwiphlyWeb.EndToEnd do
  use SwiphlyWeb, :live_view

  alias Swiphly.Visitors

  require Logger

  @impl true
  def mount(_params, _session, socket) do
    Phoenix.PubSub.subscribe(Swiphly.PubSub, "contacts")
    Phoenix.PubSub.subscribe(Swiphly.PubSub, "chats")

    socket =
      socket
      |> assign(:contacts, Visitors.list_contacts())
      |> assign(:last_chat, List.first(Visitors.list_chats()))

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
      <.live_component module={SwiphlyWeb.SvelteComponent} id="contacts" name="E2E" props={%{contacts: @contacts, last_chat: @last_chat}} />
    """
  end

  @impl true
  def handle_info({:new_contact, contact}, socket) do
    socket =
      socket
      |> assign(:contacts, [contact | socket.assigns.contacts])

    {:noreply, socket}
  end

  @impl true
  def handle_info({:new_chat, chat}, socket) do
    socket =
      socket
      |> assign(:last_chat, chat)

    {:noreply, socket}
  end

  @impl true
  def handle_event("create", params, socket) do
    case Visitors.create_chat(params) do
      {:ok, chat} ->
        socket =
          socket
          |> assign(:last_chat, chat)

        {:reply, %{success: true}, socket}

      {:error, changeset} ->
        error =
          changeset.errors
          |> Enum.map(fn {field, {failure, _}} -> "#{field} #{failure}" end)
          |> Enum.join(", ")

        {:reply, %{success: false, reason: error}, socket}

      _ ->
        {:reply, %{success: false}, socket}
    end
  end
end
