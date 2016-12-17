defmodule Studentmanager.Repo.Migrations.AddUserIdToProfile do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :first_name, :string
      add :last_name, :string
      add :date_of_birth, :date
      add :gender, :string
      add :home_phone, :string
      add :mobile, :string
      add :user_id, :integer

      timestamps
    end
    create index(:profiles, [:user_id], unique: true)
  end
end
