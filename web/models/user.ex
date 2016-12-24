defmodule Studentmanager.User do
  use Studentmanager.Web, :model

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string

    belongs_to :teacher, Studentmanager.User
    has_many :students, Studentmanager.User, foreign_key: :teacher_id, on_delete: :delete_all
    has_one :profile, Studentmanager.Profile, foreign_key: :user_id

    timestamps
  end

  @required_fields ~w(username password)
  @optional_fields ~w(email)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def new_student_changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(username email teacher_id), [])
  end

  def registration_changeset(model, params \\ :empty) do
    model
      |> changeset(params)
      |> cast(params, ~w(password), [])
      |> validate_length(:password, min: 6, max: 100)
      |> put_pass_hash
  end
 
  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} -> put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ -> changeset
    end
  end
end
