class CreateLessonClasses < ActiveRecord::Migration
  def self.up
    create_table :lesson_classes do |t|
      t.integer :lesson_id
      t.integer :class_detail_id
      t.string :unique_classid
      t.integer :teacherid

      t.timestamps
    end
  end

  def self.down
    drop_table :lesson_classes
  end
end
