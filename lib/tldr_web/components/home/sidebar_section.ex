defmodule TldrWeb.Home.SidebarSection do
  @moduledoc """
  UI component for the home page sidebar.

  """
  use TldrWeb, :html

  attr :header, :string, required: true
  attr :path, :string, required: true
  slot(:inner_block, required: false)

  def sidebar_section(assigns) do
    ~H"""
    <.link navigate={@path}>
      <div
        class="bg-white py-gr-4 shadow-xl rounded-md flex flex-1 justify-center
               my-2 lg:my-4 mx-1 lg:mx-0 hover:bg-gray-100 transition duration-200
               ease-in-out cursor-pointer"
        style="border-top: 2px solid black;"
      >
        <div>
          <.h5>
            <%= @header %>
          </.h5>
        </div>
        <div :if={@inner_block} class="flex items-center mt-4">
          <%= render_slot(@inner_block) %>
        </div>
      </div>
    </.link>
    """
  end
end
