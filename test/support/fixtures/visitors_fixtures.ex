defmodule Swiphly.VisitorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Swiphly.Visitors` context.
  """

  @doc """
  Generate a contact.
  """
  def contact_fixture(attrs \\ %{}) do
    {:ok, contact} =
      attrs
      |> Enum.into(%{
        company: "some company",
        event: "some event",
        name: "some name",
        title: "some title"
      })
      |> Swiphly.Visitors.create_contact()

    contact
  end

  @doc """
  Generate a chat.
  """
  def chat_fixture(attrs \\ %{}) do
    {:ok, chat} =
      attrs
      |> Enum.into(%{
        contact_id: 42,
        message: "some message"
      })
      |> Swiphly.Visitors.create_chat()

    chat
  end
end
