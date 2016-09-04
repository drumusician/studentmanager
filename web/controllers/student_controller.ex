defmodule Studentmanager.StudentController do
  use Studentmanager.Web, :controller

  alias Studentmanager.User

  plug :scrub_params, "user" when action in [:create, :update]

  def index(conn,_params) do
    teacher_id = conn.assigns.current_user.id
    query = from u in User,
      where: u.teacher_id == ^teacher_id
    students = Repo.all(query)
    render(conn, "index.html", students: students)
  end


  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => student_params}) do
    changeset = User.new_student_changeset(%User{}, student_params)

    case Repo.insert(changeset) do
      {:ok, _student} ->
        conn
        |> put_flash(:info, "Student created successfully.")
        |> redirect(to: student_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    student = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(student)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: student_path(conn, :index))
  end
end
