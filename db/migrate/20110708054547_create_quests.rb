class CreateQuests < ActiveRecord::Migration
  def self.up
    create_table :quests do |t|
      t.string :question
      t.string :image
      t.integer :questionnaire_id
      t.timestamps
    end
  end

  def self.down
    drop_table :quests
  end
end
