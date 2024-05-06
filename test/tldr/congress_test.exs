defmodule Tldr.CongressTest do
  use Tldr.DataCase

  alias Tldr.Congress

  describe "congresses" do
    alias Tldr.Congress.Congresses

    import Tldr.CongressFixtures

    @invalid_attrs %{}

    test "list_congresses/0 returns all congresses" do
      congresses = congresses_fixture()
      assert Congress.list_congresses() == [congresses]
    end

    test "get_congresses!/1 returns the congresses with given id" do
      congresses = congresses_fixture()
      assert Congress.get_congresses!(congresses.id) == congresses
    end

    test "create_congresses/1 with valid data creates a congresses" do
      valid_attrs = %{}

      assert {:ok, %Congresses{} = congresses} = Congress.create_congresses(valid_attrs)
    end

    test "create_congresses/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Congress.create_congresses(@invalid_attrs)
    end

    test "update_congresses/2 with valid data updates the congresses" do
      congresses = congresses_fixture()
      update_attrs = %{}

      assert {:ok, %Congresses{} = congresses} = Congress.update_congresses(congresses, update_attrs)
    end

    test "update_congresses/2 with invalid data returns error changeset" do
      congresses = congresses_fixture()
      assert {:error, %Ecto.Changeset{}} = Congress.update_congresses(congresses, @invalid_attrs)
      assert congresses == Congress.get_congresses!(congresses.id)
    end

    test "delete_congresses/1 deletes the congresses" do
      congresses = congresses_fixture()
      assert {:ok, %Congresses{}} = Congress.delete_congresses(congresses)
      assert_raise Ecto.NoResultsError, fn -> Congress.get_congresses!(congresses.id) end
    end

    test "change_congresses/1 returns a congresses changeset" do
      congresses = congresses_fixture()
      assert %Ecto.Changeset{} = Congress.change_congresses(congresses)
    end
  end
end
