defmodule TldrWeb.HomeLive do
  use TldrWeb, :live_view

  import TldrWeb.PageComponents
  import TldrWeb.Home.SidebarSection

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
                Upcoming Votes
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
    ok(socket)
  end
end
