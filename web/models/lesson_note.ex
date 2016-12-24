defmodule Studentmanager.LessonNote do
  use Studentmanager.Web, :model

  @primary_key false
  schema "lessons_notes" do
    belongs_to :lesson, Studentmanager.Lesson
    belongs_to :note, Studentmanager.Note

    timestamps
  end
end
