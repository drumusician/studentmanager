defmodule Studentmanager.StudentControllerTest do
  use Studentmanager.ConnCase
  alias Studentmanager.User
  use ExUnit.Case, async: true

  setup do
    teacher = insert_teacher(name: "leraar")
    conn = assign(conn(), :current_user, teacher)
    {:ok, conn: conn, teacher: teacher}
  end

  test "Show only students for currently logged in teacher on index", %{conn: conn, teacher: teacher} do
    student = insert_student(teacher, name: "student", email: "student_email")
    conn = get conn, student_path(conn, :index) 
    assert html_response(conn, 200) =~ "Students"
    assert html_response(conn, 200) =~ "#{student.email}"
  end

  @tag :pending
  test "renders form for adding new student", %{conn: conn} do
    
  end

  @tag :pending
  test "validates valid attributes for new student and saves and redirects correctly", %{conn: conn} do
    
  end

  @tag :pending
  test "deleting a user removes the user from the database and renders the index page", %{conn: conn} do
    
  end

  @tag :pending
  test "it renders a show view for an individual student with additional related data", %{conn: conn} do
    
  end

end
   

