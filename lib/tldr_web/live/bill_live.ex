defmodule TldrWeb.BillLive do
  use TldrWeb, :live_view

  import TldrWeb.PageComponents

  alias Tldr.{Bills, Repo}

  @impl true
  def render(assigns) do
    ~H"""
    <.single_layout>
      <div class="h-full lg:h-screen">
        <div class="lg:grid grid-cols-12 gap-6">
          <div class="col-span-12 sm:col-span-12 lg:col-span-8 xxl:col-span-8 mx-1 lg:mx-0">
            <.content_container>
              <.desktop_div>
                <div>
                  <.h4><%= @bill.congress.name %></.h4>
                </div>
              </.desktop_div>
            </.content_container>
            <.content_container>
              <.desktop_div>
                <div>
                  <.h4><%= @bill.title %></.h4>
                </div>
                <div :if={@bill.summary}>
                  <%= raw(@bill.summary) %>
                </div>
              </.desktop_div>
            </.content_container>
          </div>
          <div class="col-span-12 sm:col-span-12 lg:col-span-4 xxl:col-span-4 xs:m-0">
            <.content_container>
              <%= @bill.congress.name %>
              <.desktop_div>
                <.h4>Sponsors</.h4>
                <ul></ul>
              </.desktop_div>
            </.content_container>
          </div>
        </div>
      </div>
    </.single_layout>
    """
  end

  @impl true
  def mount(params, _session, socket) do
    socket
    |> assign(bill: bill(params["id"]))
    |> ok()
  end

  defp bill(bill_number) do
    Bills.list_bills(%{bill_number: bill_number, preload_congress: true})
    |> Repo.one()
  end
end
