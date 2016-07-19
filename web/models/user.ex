defmodule Studentmanager.User do
  use Studentmanager.Web, :model
  import Ecto.Query

  schema "users" do
    field :name, :string
    field :date_of_birth, Ecto.Date
    field :gender, :string
    field :email, :string
    field :mobile, :string
    field :role, :string

    has_many :students, User, []

    timestamps
  end

  @required_fields ~w(name )
  @optional_fields ~w(date_of_birth gender email mobile)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
