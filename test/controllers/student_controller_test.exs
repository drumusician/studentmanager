defmodule Studentmanager.StudentControllerTest do
  use Studentmanager.ConnCase
  alias Studentmanager.User
  use ExUnit.Case

  test "Show only students for currently logged in teacher on index", %{conn: conn} do
    teacher = %User{name: "Teacher", id: 12, password: "supersecret"}
    Studentmanager.Auth.login(conn, teacher)
    conn = fetch_session(conn)
    conn = get conn, student_path(conn, :index) 
    conn.assign(:current_user, teacher)
    assert html_response(conn, 200) =~ "Students"
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
   

