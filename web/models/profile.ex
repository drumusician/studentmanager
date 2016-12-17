defmodule Studentmanager.Profile do
  use Studentmanager.Web, :model

  schema "profiles" do
    field :first_name, :string
    field :last_name, :string
    field :date_of_birth, Ecto.Date
    field :gender, :string
    field :home_phone, :string
    field :mobile, :string

    belongs_to :user, Studentmanager.User

    timestamps
  end

  @required_fields ~w(first_name)
  @optional_fields ~w(last_name date_of_birth)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

end
