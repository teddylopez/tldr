defmodule Tldr.AmendmentsTest do
  use Tldr.DataCase

  alias Tldr.Amendments

  describe "amendments" do
    alias Tldr.Amendments.Amendment

    import Tldr.AmendmentsFixtures

    @invalid_attrs %{}

    test "list_amendments/0 returns all amendments" do
      amendment = amendment_fixture()
      assert Amendments.list_amendments() == [amendment]
    end

    test "get_amendment!/1 returns the amendment with given id" do
      amendment = amendment_fixture()
      assert Amendments.get_amendment!(amendment.id) == amendment
    end

    test "create_amendment/1 with valid data creates a amendment" do
      valid_attrs = %{}

      assert {:ok, %Amendment{} = amendment} = Amendments.create_amendment(valid_attrs)
    end

    test "create_amendment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Amendments.create_amendment(@invalid_attrs)
    end

    test "update_amendment/2 with valid data updates the amendment" do
      amendment = amendment_fixture()
      update_attrs = %{}

      assert {:ok, %Amendment{} = amendment} = Amendments.update_amendment(amendment, update_attrs)
    end

    test "update_amendment/2 with invalid data returns error changeset" do
      amendment = amendment_fixture()
      assert {:error, %Ecto.Changeset{}} = Amendments.update_amendment(amendment, @invalid_attrs)
      assert amendment == Amendments.get_amendment!(amendment.id)
    end

    test "delete_amendment/1 deletes the amendment" do
      amendment = amendment_fixture()
      assert {:ok, %Amendment{}} = Amendments.delete_amendment(amendment)
      assert_raise Ecto.NoResultsError, fn -> Amendments.get_amendment!(amendment.id) end
    end

    test "change_amendment/1 returns a amendment changeset" do
      amendment = amendment_fixture()
      assert %Ecto.Changeset{} = Amendments.change_amendment(amendment)
    end
  end
end
