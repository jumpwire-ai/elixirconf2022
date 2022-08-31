defmodule Swiphly.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :contact_id, :integer
      add :message, :string

      timestamps()
    end
  end
end
