defmodule TldrWeb.LayoutComponents do
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

  import TldrWeb.PageComponents
  import TldrWeb.CoreComponents

  attr(:class, :string, default: "")
  attr(:rest, :global)
  slot(:side_content, required: true)
  slot(:main_content, required: true)

  def main_with_sidebar(assigns) do
    ~H"""
    <div x-data="{ sidebarOpen: false }" class="t-content-container mt-[4rem] lg:mt-[0rem]" {@rest}>
      <%= render_slot(@side_content) %>

      <div class={"flex flex-1 flex-col lg:pl-64 lg:pr-20 lg:mt-[4.5rem] #{@class}"}>
        <main class="flex-1">
          <div class="lg:mt-[1rem] lg:mx-0 max-w-7xl lg:px-4">
            <%= render_slot(@main_content) %>
          </div>
        </main>
      </div>
    </div>
    """
  end

  attr(:header, :string, required: false, default: nil)
  attr(:link_text, :string, required: false, default: nil)
  attr(:link_url, :string, required: false, default: nil)
  attr(:class, :string, required: false, default: "")
  attr(:rest, :global, include: ~w(x-data phx_hook))
  slot(:inner_block, required: true)
  slot(:action_button, required: false)

  def single_layout(assigns) do
    ~H"""
    <div class={"lg-mx-0 sm:px-auto px-8 #{@class}"} {@rest}>
      <div class="lg:grid grid-cols-12 gap-6">
        <div class="col-span-12">
          <div :if={@link_url} class="flex flex-row-reverse mx-1 lg:mx-0 mt-4">
            <.link navigate={@link_url}>
              <.wide_button_primary class="shadow-xl border box">
                <%= @link_text %>
              </.wide_button_primary>
            </.link>
          </div>
          <%= if @header do %>
            <.content_container header={@header}>
              <%= render_slot(@inner_block) %>
            </.content_container>
          <% else %>
            <%= render_slot(@inner_block) %>
          <% end %>
        </div>
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

  attr(:header, :string, required: false, default: nil)
  slot(:action_button, required: false)
  attr(:link_text, :string, required: false, default: nil)
  attr(:link_url, :string, required: false, default: nil)
  attr(:rest, :global, include: ~w(x-data phx_hook))
  slot(:inner_block, required: true)

  def full_page_layout(assigns) do
    ~H"""
    <div class="mx-1 sm:px-auto lg:px-auto lg:px-auto" {@rest}>
      <div class="h-full lg:h-screen">
        <div class="lg:grid grid-cols-12 gap-6">
          <div class="col-span-12">
            <div :if={@link_url} class="flex flex-row-reverse">
              <div class="mx-0 lg:mx-4 mt-5">
                <.link navigate={@link_url}>
                  <.wide_button_primary class="shadow-xl border box">
                    <%= @link_text %>
                  </.wide_button_primary>
                </.link>
              </div>
            </div>
            <%= if @header do %>
              <.content_container header={@header}>
                <%= render_slot(@inner_block) %>
              </.content_container>
            <% else %>
              <%= render_slot(@inner_block) %>
            <% end %>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
