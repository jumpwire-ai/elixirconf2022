defmodule Swiphly.VisitorsTest do
  use Swiphly.DataCase

  alias Swiphly.Visitors

  describe "contacts" do
    alias Swiphly.Visitors.Contact

    import Swiphly.VisitorsFixtures

    @invalid_attrs %{company: nil, event: nil, name: nil, title: nil}

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Visitors.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Visitors.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      valid_attrs = %{company: "some company", event: "some event", name: "some name", title: "some title"}

      assert {:ok, %Contact{} = contact} = Visitors.create_contact(valid_attrs)
      assert contact.company == "some company"
      assert contact.event == "some event"
      assert contact.name == "some name"
      assert contact.title == "some title"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Visitors.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      update_attrs = %{company: "some updated company", event: "some updated event", name: "some updated name", title: "some updated title"}

      assert {:ok, %Contact{} = contact} = Visitors.update_contact(contact, update_attrs)
      assert contact.company == "some updated company"
      assert contact.event == "some updated event"
      assert contact.name == "some updated name"
      assert contact.title == "some updated title"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Visitors.update_contact(contact, @invalid_attrs)
      assert contact == Visitors.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Visitors.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Visitors.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Visitors.change_contact(contact)
    end
  end
end
