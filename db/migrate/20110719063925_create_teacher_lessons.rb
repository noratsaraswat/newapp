class CreateTeacherLessons < ActiveRecord::Migration
  def self.up
    create_table :teacher_lessons do |t|
      t.integer :lesson_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :teacher_lessons
  end
end
