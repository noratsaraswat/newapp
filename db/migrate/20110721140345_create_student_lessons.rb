class CreateStudentLessons < ActiveRecord::Migration
  def self.up
    create_table :student_lessons do |t|
      t.integer :lesson_id
      t.integer :user_id
      t.integer :finished

      t.timestamps
    end
  end

  def self.down
    drop_table :student_lessons
  end
end
