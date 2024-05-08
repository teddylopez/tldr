defmodule TldrWeb.HomeLive do
  use TldrWeb, :live_view

  import TldrWeb.PageComponents
  # import TldrWeb.Home.SidebarSection

  alias Tldr.{Bills.Bill, Congresses, Repo}
  alias TldrWeb.Helpers.GlobalHelpers

  @impl true
  def render(assigns) do
    ~H"""
    <.single_layout>
      <div class="h-full lg:h-screen">
        <div class="lg:grid grid-cols-12 gap-6">
          <div class="col-span-12 sm:col-span-12 lg:col-span-8 xxl:col-span-8 mx-1 lg:mx-0">
            <.content_container>
              <.mobile_div>
                stuff
              </.mobile_div>

              <.mobile_div>
                yo
              </.mobile_div>

              <.desktop_div>
                Welcome to tldr.gov
              </.desktop_div>
            </.content_container>
          </div>
          <div class="col-span-12 sm:col-span-12 lg:col-span-4 xxl:col-span-4 xs:m-0">
            <.content_container>
              <.desktop_div>
                <.h4><%= @congress.name %> Recent bills</.h4>
                <ul>
                  <%= for bill <- @congress.bills do %>
                    <li class="text-xs my-4 border rounded-sm px-2">
                      <div class="flex justify-between items-center text-[10px] gap-x-8">
                        <div class="font-semibold">
                          <%= action_text(bill) %>
                        </div>
                        <div>
                          <%= action_date(bill) %>
                        </div>
                      </div>
                      <div class="text-[10px] mt-1">
                        <%= bill.title %>
                      </div>
                    </li>
                  <% end %>
                </ul>
              </.desktop_div>
            </.content_container>
          </div>
        </div>
      </div>
    </.single_layout>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    socket
    |> assign(congress: latest_congress())
    |> ok()
  end

  defp action_text(%Bill{latest_action: action}), do: action["text"]

  defp action_date(%Bill{latest_action: action}),
    do: GlobalHelpers.standardize_date(action["actionDate"])

  defp latest_congress do
    Congresses.list_congresses(%{
      preload_bills: true,
      sort: :latest_congress
    })
    |> Repo.one()
  end
end
