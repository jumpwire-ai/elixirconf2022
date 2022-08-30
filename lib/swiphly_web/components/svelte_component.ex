defmodule SwiphlyWeb.SvelteComponent do
  use SwiphlyWeb, :live_component
  require Logger

  def render(assigns) do
    ~H"""
    <div id={@id || @name} data-name={@name} data-props={json(@props)} phx-update="ignore" phx-hook="SvelteComponent"></div>
    """
  end

  defp json(nil), do: ""
  defp json(props) do
    case Jason.encode(props) do
      {:ok, data} -> data
      {:error, err} ->
        Logger.error("Could not JSON encode props: #{inspect err}")
        ""
    end
  end
end
