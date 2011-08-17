class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.integer :lessionID
      t.string :classname
      t.integer :classID

      t.timestamps
    end
  end

  def self.down
    drop_table :teachers
  end
end
