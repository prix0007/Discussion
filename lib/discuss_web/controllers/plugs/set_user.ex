defmodule DiscussWeb.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do

  end

  def call(conn, _params) do
    user_id = conn
      |> get_session(:user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)
        #conn.assigns.user => user struct
      true ->
        assign(conn, :user, nil)
    end
  end
end
