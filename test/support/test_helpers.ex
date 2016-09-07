defmodule Studentmanager.TestHelpers do
  alias Studentmanager.Repo

  def insert_teacher(attrs \\ %{}) do
    changes = Dict.merge(%{
          name: "teacher",
          password: "supersecret", 
                         }, attrs)

    %Studentmanager.User{}
    |> Studentmanager.User.registration_changeset(changes)
    |> Repo.insert!()
  end


  def insert_student(teacher, attrs \\ %{}) do
    teacher
    |> Ecto.build_assoc(:students, attrs)
    |> Repo.insert!()
  end
end
