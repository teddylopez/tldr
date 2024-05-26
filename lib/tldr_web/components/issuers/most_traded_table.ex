defmodule TldrWeb.Components.Issuers.MostTradedTable do
  @moduledoc """
  UI component for the 'most traded' table.

  """
  use TldrWeb, :html

  attr :issuers, :list, required: true

  def most_traded_table(assigns) do
    ~H"""
    <div class="overflow-scroll scroll-smooth my-6 h-[500px]">
      <table class="text-xs" style="border-collapse: separate; border-spacing: 0 1px;">
        <thead class="bg-white dark:bg-gray-600" style="position: sticky; top: 0; z-index: 5;">
          <tr>
            <th></th>
            <th><%= dgettext("issuers", "Most Traded") %></th>
            <th><%= dgettext("default", "Trades") %></th>
            <th><%= dgettext("default", "Politicians") %></th>
          </tr>
        </thead>
        <tbody>
          <%= for {issuer, index} <- Enum.with_index(@issuers, 1) do %>
            <tr>
              <td class="text-gray-400">
                <%= index %>
              </td>
              <td>
                <.link navigate={~p"/issuers/#{issuer.id}"}>
                  <%= issuer.name %>
                </.link>
              </td>
              <td>
                <%= issuer.number_of_trades %>
              </td>
              <td>
                <%= issuer.number_of_politicians %>
              </td>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end
end
