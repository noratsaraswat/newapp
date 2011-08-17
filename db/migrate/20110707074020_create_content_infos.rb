class CreateContentInfos < ActiveRecord::Migration
  def self.up
    create_table :content_infos do |t|
      t.string :name
      t.string :path
      t.timestamps
    end
  end

  def self.down
    drop_table :content_infos
  end
end
