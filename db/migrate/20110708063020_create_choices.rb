class CreateChoices < ActiveRecord::Migration
  def self.up
    create_table :choices do |t|
      t.string :ChoiceAnswers
      t.integer :quest_id
      t.boolean :answer
      t.timestamps
    end
  end

  def self.down
    drop_table :choices
  end
end
