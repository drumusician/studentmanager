defmodule Studentmanager.SessionController do
  use Studentmanager.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
    case Studentmanager.Auth.login_by_username_and_pass(conn, user, pass, repo: Studentmanager.Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Successfully logged in!")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Loggin failed, invalid credentials!")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Studentmanager.Auth.logout()
    |> redirect(to: page_path(conn, :index))
  end
end
