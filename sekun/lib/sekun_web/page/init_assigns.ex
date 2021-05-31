defmodule SekunWeb.Page.InitAssigns do
  import Phoenix.LiveView

  alias SekunWeb.Router.Helpers, as: Routes

  def on_mount(:default, _params, _session, socket) do
    socket =
      attach_hook(socket, :set_current_path, :handle_params, fn _params, url, socket ->
        socket =
          socket
          |> assign(current_path: URI.parse(url).path)

        {:cont, socket}
      end)

    {:cont, socket}
  end
end
