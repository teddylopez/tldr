defmodule Tldr.CongressMembersTest do
  use Tldr.DataCase

  alias Tldr.CongressMembers

  describe "congress_members" do
    alias Tldr.CongressMembers.CongressMember

    import Tldr.CongressMembersFixtures

    @invalid_attrs %{}

    test "list_congress_members/0 returns all congress_members" do
      congress_member = congress_member_fixture()
      assert CongressMembers.list_congress_members() == [congress_member]
    end

    test "get_congress_member!/1 returns the congress_member with given id" do
      congress_member = congress_member_fixture()
      assert CongressMembers.get_congress_member!(congress_member.id) == congress_member
    end

    test "create_congress_member/1 with valid data creates a congress_member" do
      valid_attrs = %{}

      assert {:ok, %CongressMember{} = congress_member} = CongressMembers.create_congress_member(valid_attrs)
    end

    test "create_congress_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CongressMembers.create_congress_member(@invalid_attrs)
    end

    test "update_congress_member/2 with valid data updates the congress_member" do
      congress_member = congress_member_fixture()
      update_attrs = %{}

      assert {:ok, %CongressMember{} = congress_member} = CongressMembers.update_congress_member(congress_member, update_attrs)
    end

    test "update_congress_member/2 with invalid data returns error changeset" do
      congress_member = congress_member_fixture()
      assert {:error, %Ecto.Changeset{}} = CongressMembers.update_congress_member(congress_member, @invalid_attrs)
      assert congress_member == CongressMembers.get_congress_member!(congress_member.id)
    end

    test "delete_congress_member/1 deletes the congress_member" do
      congress_member = congress_member_fixture()
      assert {:ok, %CongressMember{}} = CongressMembers.delete_congress_member(congress_member)
      assert_raise Ecto.NoResultsError, fn -> CongressMembers.get_congress_member!(congress_member.id) end
    end

    test "change_congress_member/1 returns a congress_member changeset" do
      congress_member = congress_member_fixture()
      assert %Ecto.Changeset{} = CongressMembers.change_congress_member(congress_member)
    end
  end
end
