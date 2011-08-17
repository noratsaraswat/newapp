class CreateAdminPeopleLessons < ActiveRecord::Migration
  def self.up
    create_table :admin_people_lessons,:id=>false do |t|
      t.integer :admin_person_id
      t.integer :lesson_id
      t.timestamps
    end
  end

  def self.down
    drop_table :admin_people_lessons
  end
end
