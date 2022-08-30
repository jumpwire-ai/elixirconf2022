defmodule Swiphly.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :name, :string
      add :title, :string
      add :company, :string
      add :event, :string

      timestamps()
    end
  end
end
