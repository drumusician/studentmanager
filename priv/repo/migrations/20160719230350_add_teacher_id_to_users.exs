defmodule Studentmanager.Repo.Migrations.AddTracherIdToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :teacher_id, :integer 
    end
  end
end
