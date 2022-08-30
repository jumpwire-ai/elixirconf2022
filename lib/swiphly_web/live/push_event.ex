defmodule SwiphlyWeb.PushEvent do
  use SwiphlyWeb, :live_view

  alias Swiphly.Visitors

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
      <.live_component module={SwiphlyWeb.SvelteComponent} id="contacts" name="Contacts" props={%{contacts: @contacts}} />
    """
  end

  @impl true
  def handle_event("create", params, %{assigns: %{contacts: contacts}} = socket) do
    case Visitors.create_contact(params) do
      {:ok, contact} ->
        socket =
          socket
          |> assign(:contacts, [contact] ++ contacts)

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

  @impl true
  def handle_event("delete", %{"contact_id" => id}, %{assigns: %{contacts: contacts}} = socket) do
    with contact <- Visitors.get_contact!(id),
         {:ok, _} <- Visitors.delete_contact(contact) do
      socket =
        socket
        |> assign(:contacts, Enum.reject(contacts, fn c -> c.id == id end))

      {:noreply, socket}
    else
      _ ->
        {:noreply, socket}
    end
  end
end
