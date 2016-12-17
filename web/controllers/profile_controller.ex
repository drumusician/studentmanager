defmodule Studentmanager.ProfileController do
  use Studentmanager.Web, :controller
  alias Studentmanager.Profile

  plug :scrub_params, "profile" when action in [:create]

  def new(conn, _params) do
    changeset =
    conn.assigns.current_user
    |> build_assoc(:profile)
    |> Profile.changeset()
    IO.inspect changeset
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"profile" => profile_params}) do
    IO.inspect profile_params
    changeset =
    conn.assigns.current_user
    |> build_assoc(:profile)
    |> Profile.changeset(profile_params) 

    case Repo.insert(changeset) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile successfully created!")
        |> redirect(to: "/my_account")
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get!(Profile, id)
    changeset = Profile.changeset(user)
    render(conn, "edit.html", changeset: changeset)
    
  end
  def show(conn, _params) do
    user = Repo.get!(Studentmanager.User, conn.assigns.current_user.id)
    profile = Repo.get_by(Studentmanager.Profile, user_id: conn.assigns.current_user.id)
    cond profile do
      is_nil profile ->
        render(conn, "show.html", user: user, profile: profile)
      true ->
        redirect(conn, to: profile_path(conn, :new))
    end
  end
end
