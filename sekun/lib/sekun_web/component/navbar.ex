defmodule SekunWeb.Component.Navbar do
  use Phoenix.Component

  def navbar(assigns) do
    ~H"""
    <nav class="bg-white dark:bg-su-dark-bg">
      <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
        <div class="relative flex items-center justify-between h-16">
          <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
            <!-- Mobile menu button -->
            <button type="button" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
              <span class="sr-only">Open main menu</span>
              <!--
                Icon when menu is closed.

                Heroicon name: outline/menu

                Menu open: "hidden", Menu closed: "block"
              -->
              <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
              </svg>
              <!--
                Icon when menu is open.

                Heroicon name: outline/x

                Menu open: "block", Menu closed: "hidden"
              -->
              <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
          <div class="flex-1 flex items-center justify-center sm:items-stretch">
            <div class="hidden sm:block sm:ml-6">
              <div class="flex space-x-4">
                <%= for link <- @link do %>
                  <%= live_redirect to: link.to,
                    class: active_class(link.to, link.current_path),
                    aria_current: "page" do %>
                    <%= render_slot(link) %>
                  <% end %>
                <% end %>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Mobile menu, show/hide based on menu state. -->
      <div class="sm:hidden" id="mobile-menu">
        <div class="px-2 pt-2 pb-3 space-y-1">
          <!-- Current: "bg-su-bg dark:bg-su-dark-bg text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
          <a href="#" class="bg-su-bg dark:bg-su-dark-bg text-white block px-3 py-2 rounded-md text-base font-medium" aria-current="page">Home</a>

          <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Portfolio</a>

          <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Blog</a>
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
