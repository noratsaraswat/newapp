class CreateTeacherDetails < ActiveRecord::Migration
  def self.up
    create_table :teacher_details do |t|
      t.integer :lessionID
      t.string :classname
      t.integer :classID

      t.timestamps
    end
  end

  def self.down
    drop_table :teacher_details
  end
end
