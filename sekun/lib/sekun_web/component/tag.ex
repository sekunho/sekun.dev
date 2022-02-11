defmodule SekunWeb.Component.Tag do
  use Phoenix.Component

  def tag(assigns) do
    ~H"""
    <span
      class="inline-flex items-center px-2.5 py-0.5 rounded-md text-xs sm:text-sm font-medium bg-su-accent-1/[0.2] dark:bg-su-dark-accent-1/[0.2] text-su-accent-1/[0.7] dark:text-su-dark-fg/[0.7]">
      <%= render_slot(@inner_block) %>
    </span>
    """
  end
end
