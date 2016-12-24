import Ecto
alias Studentmanager.Repo
alias Studentmanager.User
alias Studentmanager.Profile

Repo.delete_all User

teachers = [
  %{
    username: "dennis",
    password: "dennis_pass",
    email: "dennis@example.com",
    students: [
      %{
        username: "tjaco",
        email: "tjaco@example.com",
        date_of_birth: "1981-01-07"
      },
      %{
        username: "noah",
        email: "noah@example.com",
        date_of_birth: "1999-01-20"
      }
    ],
    profile: [
      %{
        first_name: "Dennis",
        last_name: "Chambers",
        date_of_birth: "1969-01-12"
      }
    ]
  },
  %{
    username: "dave",
    password: "dave_pass",
    email: "dave@example.com",
    students: [
      %{
        username: "marius",
        email: "marius@example.com",
        date_of_birth: "1983-02-25"
      },
      %{
        username: "misja",
        email: "misja@example.com",
        date_of_birth: "2012-02-03"
      }
    ],
    profile: [
      %{
        first_name: "Dave",
        last_name: "Weckl",
        date_of_birth: "1970-09-01"
      }
    ]
  }
]

Enum.each teachers, fn(teacher) ->
  changeset = User.registration_changeset(%User{}, teacher)
  {:ok, created_teacher} = Studentmanager.Repo.insert(changeset)
  Enum.each teacher.students, fn(student) ->
    changeset =
      created_teacher
      |> build_assoc(:students)
      |> User.new_student_changeset(student)
    Repo.insert!(changeset)
  end

  changeset =
    created_teacher 
    |> build_assoc(:profile)
    |> Profile.changeset(teacher.profile)
  Repo.insert!(changeset)
end
