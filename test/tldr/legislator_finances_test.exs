defmodule Tldr.LegislatorFinancesTest do
  use Tldr.DataCase

  alias Tldr.LegislatorFinances

  describe "legislator_finances" do
    alias Tldr.LegislatorFinances.LegislatorFinance

    import Tldr.LegislatorFinancesFixtures

    @invalid_attrs %{}

    test "list_legislator_finances/0 returns all legislator_finances" do
      legislator_finance = legislator_finance_fixture()
      assert LegislatorFinances.list_legislator_finances() == [legislator_finance]
    end

    test "get_legislator_finance!/1 returns the legislator_finance with given id" do
      legislator_finance = legislator_finance_fixture()
      assert LegislatorFinances.get_legislator_finance!(legislator_finance.id) == legislator_finance
    end

    test "create_legislator_finance/1 with valid data creates a legislator_finance" do
      valid_attrs = %{}

      assert {:ok, %LegislatorFinance{} = legislator_finance} = LegislatorFinances.create_legislator_finance(valid_attrs)
    end

    test "create_legislator_finance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LegislatorFinances.create_legislator_finance(@invalid_attrs)
    end

    test "update_legislator_finance/2 with valid data updates the legislator_finance" do
      legislator_finance = legislator_finance_fixture()
      update_attrs = %{}

      assert {:ok, %LegislatorFinance{} = legislator_finance} = LegislatorFinances.update_legislator_finance(legislator_finance, update_attrs)
    end

    test "update_legislator_finance/2 with invalid data returns error changeset" do
      legislator_finance = legislator_finance_fixture()
      assert {:error, %Ecto.Changeset{}} = LegislatorFinances.update_legislator_finance(legislator_finance, @invalid_attrs)
      assert legislator_finance == LegislatorFinances.get_legislator_finance!(legislator_finance.id)
    end

    test "delete_legislator_finance/1 deletes the legislator_finance" do
      legislator_finance = legislator_finance_fixture()
      assert {:ok, %LegislatorFinance{}} = LegislatorFinances.delete_legislator_finance(legislator_finance)
      assert_raise Ecto.NoResultsError, fn -> LegislatorFinances.get_legislator_finance!(legislator_finance.id) end
    end

    test "change_legislator_finance/1 returns a legislator_finance changeset" do
      legislator_finance = legislator_finance_fixture()
      assert %Ecto.Changeset{} = LegislatorFinances.change_legislator_finance(legislator_finance)
    end
  end
end
