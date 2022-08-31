defmodule Swiphly.Visitors.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  # NOTE you would want to enforce references through ecto associations
  # We use a simpler approach here for demonstration purposes
  @derive {Jason.Encoder, only: [:id, :contact_id, :message, :inserted_at]}
  schema "chats" do
    field :contact_id, :integer
    field :message, :string

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:contact_id, :message])
    |> validate_required([:contact_id, :message])
  end
end
