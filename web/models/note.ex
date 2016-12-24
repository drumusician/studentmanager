defmodule Studentmanager.Note do
  use Studentmanager.Web, :model

  schema "notes" do
    field :title, :string
    field :body, :string

    timestamps
  end
end
