defmodule TldrWeb.IssuersLive do
  use TldrWeb, :live_view

  import TldrWeb.PageComponents
  import TldrWeb.Components.Issuers.MostTradedTable

  alias Tldr.Repo

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
                  <.h4>Issuers</.h4>
                </div>
              </.desktop_div>
            </.content_container>
          </div>
          <div class="col-span-12 sm:col-span-12 lg:col-span-4 xxl:col-span-4 xs:m-0">
            <.content_container>
              <.desktop_div>
                <.most_traded_table issuers={@issuers} />
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
    |> assign(issuers: issuers())
    |> ok()
  end

  defp issuers do
    Tldr.Issuers.list_issuers(%{sort_by: :number_of_trades})
    |> Repo.all()
  end
end
