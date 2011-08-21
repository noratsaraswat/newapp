class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :choice_id
      t.integer :user_id
      t.integer :questionnaire_id
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
