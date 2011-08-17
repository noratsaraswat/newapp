class CreateContentDevelopers < ActiveRecord::Migration
  def self.up
    create_table :content_developers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :content_developers
  end
end
