defmodule SekunWeb.Component.Navbar do
  use Phoenix.Component

  import Phoenix.HTML.Link

  def navbar(assigns) do
    ~H"""
    <nav class="bg-white dark:bg-su-dark-bg">
      <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
        <div class="relative flex items-center justify-between h-16">
          <div class="flex-1 flex items-center justify-center sm:items-stretch">
            <div class="hidden sm:block sm:ml-6">
              <div class="flex space-x-4">
                <%= for link <- @link do %>
                  <%= if link.external do %>
                    <%= link to: link.to,
                      class: active_class(link.to, link.current_path) do %>
                      <%= render_slot(link) %>
                    <% end %>

                  <% else %>
                    <%= live_redirect to: link.to,
                      class: active_class(link.to, link.current_path) do %>
                      <%= render_slot(link) %>
                    <% end %>
                  <% end %>
                <% end %>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Mobile menu, show/hide based on menu state. -->
      <div class="sm:hidden" id="mobile-menu">
        <div class="flex items-center justify-center px-2 pt-2 pb-3 space-y-1">
          <%= for link <- @link do %>
            <%= if link.external do %>
              <%= link to: link.to,
                  class: active_class(link.to, link.current_path) do %>
                  <%= render_slot(link) %>
              <% end %>
            <% else %>
               <%= live_redirect to: link.to,
                  class: active_class(link.to, link.current_path) do %>
                  <%= render_slot(link) %>
              <% end %>
           <% end %>
          <% end %>
        </div>
      </div>
    </nav>
    """
  end

  defp active_class(target_path, current_path) do
    cond do
      target_path == current_path ->
        "underline decoration-su-accent-1 decoration-wavy decoration-2 text-su-fg dark:text-white px-3 py-2 rounded-md text-sm font-medium"

      true ->
        "text-su-fg dark:text-gray-300 dark:hover:text-white px-3 py-2 rounded-md text-sm font-medium"
    end
  end
end
