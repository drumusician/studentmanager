defmodule Studentmanager.PageController do
  use Studentmanager.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def about(conn, _params) do
    render conn, "about.html"
  end

  def info(conn, %{"instrument" => instrument}) do
    render conn, "info.html", instrument: instrument
  end

  def info(conn, _params) do
    render conn, "info.html", instrument: "nothing" 
  end
end
