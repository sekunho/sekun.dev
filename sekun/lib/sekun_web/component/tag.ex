defmodule SekunWeb.Component.Tag do
  use Phoenix.Component

  def tag(assigns) do
    ~H"""
    <span
      class="inline-flex items-center px-2.5 py-0.5 rounded-md text-xs sm:text-sm font-medium bg-su-accent-1 dark:bg-su-dark-accent-2 text-white dark:text-su-dark-fg">
      <%= render_slot(@inner_block) %>
    </span>
    """
  end
end
