defmodule Tldr.IssuersTest do
  use Tldr.DataCase

  alias Tldr.Issuers

  describe "issuers" do
    alias Tldr.Issuers.Issuer

    import Tldr.IssuersFixtures

    @invalid_attrs %{}

    test "list_issuers/0 returns all issuers" do
      issuer = issuer_fixture()
      assert Issuers.list_issuers() == [issuer]
    end

    test "get_issuer!/1 returns the issuer with given id" do
      issuer = issuer_fixture()
      assert Issuers.get_issuer!(issuer.id) == issuer
    end

    test "create_issuer/1 with valid data creates a issuer" do
      valid_attrs = %{}

      assert {:ok, %Issuer{} = issuer} = Issuers.create_issuer(valid_attrs)
    end

    test "create_issuer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Issuers.create_issuer(@invalid_attrs)
    end

    test "update_issuer/2 with valid data updates the issuer" do
      issuer = issuer_fixture()
      update_attrs = %{}

      assert {:ok, %Issuer{} = issuer} = Issuers.update_issuer(issuer, update_attrs)
    end

    test "update_issuer/2 with invalid data returns error changeset" do
      issuer = issuer_fixture()
      assert {:error, %Ecto.Changeset{}} = Issuers.update_issuer(issuer, @invalid_attrs)
      assert issuer == Issuers.get_issuer!(issuer.id)
    end

    test "delete_issuer/1 deletes the issuer" do
      issuer = issuer_fixture()
      assert {:ok, %Issuer{}} = Issuers.delete_issuer(issuer)
      assert_raise Ecto.NoResultsError, fn -> Issuers.get_issuer!(issuer.id) end
    end

    test "change_issuer/1 returns a issuer changeset" do
      issuer = issuer_fixture()
      assert %Ecto.Changeset{} = Issuers.change_issuer(issuer)
    end
  end
end
