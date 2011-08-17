class CreateStudentDetails < ActiveRecord::Migration
  def self.up
    create_table :student_details do |t|
      t.string :user_id
      t.string :class_detail_id
      t.timestamps
    end
  end

  def self.down
    drop_table :student_details
  end
end
