defmodule SwiphlyWeb.PageController do
  use SwiphlyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
