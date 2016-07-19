defmodule Studentmanager.UserTest do
  use Studentmanager.ModelCase

  alias Studentmanager.User

  @valid_attrs %{date_of_birth: "2010-04-17", email: "some content", gender: "some content", mobile: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
