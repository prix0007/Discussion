defmodule DiscussWeb.Plugs.RequireAuth do

  import Plug.Conn
  import Phoenix.Controller

  alias DiscussWeb.Router.Helpers

  def init(_params) do
  end

  # Params comes from the init return
  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to use that")
      |> redirect(to: Helpers.topic_path(conn, :index))
      |> halt()
    end
  end

end
