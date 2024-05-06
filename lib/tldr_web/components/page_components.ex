defmodule TldrWeb.PageComponents do
  @moduledoc """
  Provides core UI components.

  At first glance, this module may seem daunting, but its goal is to provide
  core building blocks for your application, such as modals, tables, and
  forms. The components consist mostly of markup and are well-documented
  with doc strings and declarative assigns. You may customize and style
  them in any way you want, based on your application growth and needs.

  The default components use Tailwind CSS, a utility-first CSS framework.
  See the [Tailwind CSS documentation](https://tailwindcss.com) to learn
  how to customize them or feel free to swap in another framework altogether.

  Icons are provided by [heroicons](https://heroicons.com). See `icon/1` for usage.
  """
  use Phoenix.Component

  import TldrWeb.CoreComponents

  attr(:header, :string, required: false, default: nil)
  attr(:rest, :global, include: ~w(x-data))
  attr(:class, :string, default: "")
  attr(:inner_block_class, :string, default: "")
  attr(:modal, :boolean, default: false)
  attr(:modal_id, :string, default: "")
  slot(:inner_block)

  def content_container(assigns) do
    ~H"""
    <div
      class={"bg-white dark:bg-gray-600 shadow-xl dark:shadow-2xl rounded-sm my-4
              transition duration-200 ease-in-out w-full border-t-2 border-black
              dark:border-white #{@class}"}
      {@rest}
    >
      <div class="flex relative" style="top: -2px;">
        <span
          :if={@header}
          class="flex relative text-xs text-white bg-gray-800 px-2 rounded-tl rounded-br"
          style=" padding-bottom: 1px;"
        >
          <%= @header %>
          <%= if @modal do %>
            <.link phx-click={show_modal(@modal_id)} class="cursor-pointer flex ml-2">
              <.icon name="hero-information-circle" class="w-4 h-4" />
            </.link>
          <% end %>
        </span>
      </div>

      <div class={"lg:py-4 lg:px-4 px-1 #{@inner_block_class}"}>
        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  attr(:header, :string, required: false, default: nil)
  attr(:class, :string, required: false, default: nil)
  attr(:modal, :boolean, default: false)
  attr(:modal_id, :string, required: false)
  slot(:inner_block, required: true)

  def content_section(assigns) do
    ~H"""
    <div
      class={"pb-4 mx-1 lg:mx-0 w-full bg-white rounded-sm #{@class}"}
      style="border-top: 2px solid black;"
    >
      <div class="flex">
        <span
          class="flex relative text-xs text-white bg-gray-800 px-2 rounded-br rounded-bl"
          style="top: -2px; padding-bottom: 1px;"
        >
          <%= @header %>
          <%= if @modal do %>
            <.link phx-click={show_modal(@modal_id)} class="cursor-pointer flex ml-2">
              <.icon name="hero-information-circle" class="ml-1 w-4 h-4" />
            </.link>
          <% end %>
        </span>
      </div>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr(:class, :string, default: "")
  attr(:type, :string, default: nil)
  attr(:rest, :global)
  slot(:inner_block, required: true)

  def wide_button_primary(assigns) do
    ~H"""
    <button
      class={"w-60 bg-gray-800 font-semibold text-white py-1 px-4 border
              transition duration-50 ease-in-out rounded text-center cursor-pointer #{@class}"}
      type={@type}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  attr(:class, :string, default: "")
  attr(:name, :string, default: nil)
  attr(:value, :string, default: nil)
  attr(:type, :string, default: nil)
  attr(:disabled, :boolean, default: false)
  attr(:rest, :global)
  slot(:inner_block, required: true)

  def button_primary(assigns) do
    ~H"""
    <button
      class={"font-semibold text-white py-1 px-4 border border-gray-900 rounded #{@class}
              #{if @disabled == true, do: "bg-gray-500", else: "bg-gray-800 cursor-pointer"}"}
      type={@type}
      name={@name}
      value={@value}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  attr(:class, :string, default: "")
  attr(:type, :string, default: nil)
  attr(:rest, :global, include: ~w(phx_click))
  slot(:inner_block, required: true)

  def button_primary_sm(assigns) do
    ~H"""
    <button
      class={"cursor-pointer bg-gray-800 font-semibold text-white py-[2px]
              border border-gray-900 rounded text-xs font-normal #{@class}"}
      type={@type}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  attr(:class, :string, required: false, default: "")
  attr(:type, :string, default: nil)
  attr(:rest, :global)
  attr(:name, :string, required: false)
  slot(:inner_block, required: true)

  def button_secondary(assigns) do
    ~H"""
    <div
      class={"cursor-pointer bg-transparent hover:bg-gray-800 text-gray-900
              transition duration-50 ease-in-out font-semibold hover:text-white py-1 px-4 border border-gray-900 hover:border-transparent rounded #{@class}"}
      type={@type}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr(:class, :string, required: false, default: "")
  attr(:type, :string, default: nil)
  attr(:rest, :global)
  attr(:name, :string, required: false)
  slot(:inner_block, required: true)

  def button_secondary_sm(assigns) do
    ~H"""
    <div
      class={"cursor-pointer bg-transparent hover:bg-gray-800 text-gray-900
              transition duration-50 ease-in-out font-semibold hover:text-white px-2 border border-gray-900 hover:border-transparent rounded text-xs font-normal #{@class}"}
      type={@type}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot(:inner_block, required: true)
  attr(:class, :string, default: "")
  attr(:rest, :global)

  def desktop_div(assigns) do
    ~H"""
    <div class={"hidden lg:inline #{@class}"} {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot(:inner_block, required: true)
  attr(:class, :string, default: "")
  attr(:rest, :global)

  def mobile_div(assigns) do
    ~H"""
    <div class={"inline lg:hidden #{@class}"} {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr(:class, :string, required: false, default: "")
  slot(:inner_block, required: true)

  def h4(assigns) do
    ~H"""
    <h5 class={"text-gr-4 font-semibold #{@class}"}>
      <%= render_slot(@inner_block) %>
    </h5>
    """
  end

  attr(:class, :string, required: false, default: "")
  slot(:inner_block, required: true)

  def h5(assigns) do
    ~H"""
    <h5 class={"text-gr-5 font-semibold #{@class}"}>
      <%= render_slot(@inner_block) %>
    </h5>
    """
  end

  attr(:class, :string, required: false, default: "")
  slot(:inner_block, required: true)

  def h6(assigns) do
    ~H"""
    <h6 class={"text-gr-4 font-semibold #{@class}"}>
      <%= render_slot(@inner_block) %>
    </h6>
    """
  end
end
