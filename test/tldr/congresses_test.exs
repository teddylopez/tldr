defmodule Tldr.CongressesTest do
  use Tldr.DataCase

  alias Tldr.Congresses

  describe "congress_members" do
    alias Tldr.Congresses.Member

    import Tldr.CongressesFixtures

    @invalid_attrs %{}

    test "list_congress_members/0 returns all congress_members" do
      member = member_fixture()
      assert Congresses.list_congress_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Congresses.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      valid_attrs = %{}

      assert {:ok, %Member{} = member} = Congresses.create_member(valid_attrs)
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Congresses.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      update_attrs = %{}

      assert {:ok, %Member{} = member} = Congresses.update_member(member, update_attrs)
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Congresses.update_member(member, @invalid_attrs)
      assert member == Congresses.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Congresses.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Congresses.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Congresses.change_member(member)
    end
  end
end
