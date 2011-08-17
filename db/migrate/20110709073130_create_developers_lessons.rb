class CreateDevelopersLessons < ActiveRecord::Migration
  def self.up
      create_table :developers_lessons, :id=>false do |t|
      t.integer :developer_id
      t.integer :lesson_id

      t.timestamps
    end
  end

  def self.down
    drop_table :developers_lessons
  end
end
