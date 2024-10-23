class RemoveTeacherReferences < ActiveRecord::Migration[7.2]
  def change
    remove_reference :students, :teacher, foreign_key: true
  end
end
