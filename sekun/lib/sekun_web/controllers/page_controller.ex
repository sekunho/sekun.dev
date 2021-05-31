defmodule SekunWeb.PageController do
  use SekunWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
