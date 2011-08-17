class CreateLessonPages < ActiveRecord::Migration
  def self.up
    create_table :lesson_pages do |t|
      t.integer :lesson_id
      t.integer :content_info_id
      t.integer :questionnaire_id
      t.timestamps
    end
  end

  def self.down
    drop_table :lesson_pages
  end
end
