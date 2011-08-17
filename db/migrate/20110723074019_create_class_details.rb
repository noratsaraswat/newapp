class CreateClassDetails < ActiveRecord::Migration
  def self.up
    create_table :class_details do |t|
      t.string :classname

      t.timestamps
    end
  end

  def self.down
    drop_table :class_details
  end
end
