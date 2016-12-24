defmodule Studentmanager.Lesson do
  use Studentmanager.Web, :model

  schema "lessons" do
    field :date, Ecto.Date

    many_to_many :lesson_notes, Studentmanager.Note, join_through: Studentmanager.LessonNote
    #many_to_many :attendees, Studentmanager.User
  end

end
