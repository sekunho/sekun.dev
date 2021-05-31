defmodule SekunWeb.Component.Footer do
  use Phoenix.Component

  import Phoenix.HTML.Link

  def footer(assigns) do
    ~H"""
    <footer class="bg-white dark:bg-su-dark-bg">
      <div class="max-w-7xl mx-auto py-12 px-4 sm:px-6 md:flex md:items-center md:justify-between lg:px-8">
        <div class="flex justify-center space-x-6 md:order-2">
          <%= for item <- @item do %>
            <%= link to: item.to, target: "_blank", class: "text-su-fg dark:text-su-dark-fg opacity-70 hover:text-gray-500" do %>
              <%= render_slot(item) %>
            <% end %>
          <% end %>
        </div>
        <div class="mt-8 md:mt-0 md:order-1">
          <p class="text-center text-base text-su-fg dark:text-su-dark-fg opacity-70">&copy; 2022 Sek Un</p>
        </div>
      </div>
    </footer>
    """
  end
end
