defmodule Tldr.LegislatorsTest do
  use Tldr.DataCase

  alias Tldr.Legislators

  describe "legislators" do
    alias Tldr.Legislators.Legislator

    import Tldr.LegislatorsFixtures

    @invalid_attrs %{}

    test "list_legislators/0 returns all legislators" do
      legislator = legislator_fixture()
      assert Legislators.list_legislators() == [legislator]
    end

    test "get_legislator!/1 returns the legislator with given id" do
      legislator = legislator_fixture()
      assert Legislators.get_legislator!(legislator.id) == legislator
    end

    test "create_legislator/1 with valid data creates a legislator" do
      valid_attrs = %{}

      assert {:ok, %Legislator{} = legislator} = Legislators.create_legislator(valid_attrs)
    end

    test "create_legislator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Legislators.create_legislator(@invalid_attrs)
    end

    test "update_legislator/2 with valid data updates the legislator" do
      legislator = legislator_fixture()
      update_attrs = %{}

      assert {:ok, %Legislator{} = legislator} = Legislators.update_legislator(legislator, update_attrs)
    end

    test "update_legislator/2 with invalid data returns error changeset" do
      legislator = legislator_fixture()
      assert {:error, %Ecto.Changeset{}} = Legislators.update_legislator(legislator, @invalid_attrs)
      assert legislator == Legislators.get_legislator!(legislator.id)
    end

    test "delete_legislator/1 deletes the legislator" do
      legislator = legislator_fixture()
      assert {:ok, %Legislator{}} = Legislators.delete_legislator(legislator)
      assert_raise Ecto.NoResultsError, fn -> Legislators.get_legislator!(legislator.id) end
    end

    test "change_legislator/1 returns a legislator changeset" do
      legislator = legislator_fixture()
      assert %Ecto.Changeset{} = Legislators.change_legislator(legislator)
    end
  end
end
