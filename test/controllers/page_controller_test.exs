defmodule Studentmanager.PageControllerTest do
  use Studentmanager.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to StudMan"
  end
end
