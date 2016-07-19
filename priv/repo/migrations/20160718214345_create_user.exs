defmodule Studentmanager.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :date_of_birth, :date
      add :gender, :string
      add :email, :string
      add :mobile, :string

      timestamps
    end

  end
end
