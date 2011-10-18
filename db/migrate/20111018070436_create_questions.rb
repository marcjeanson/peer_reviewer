class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_text
      t.integer :review_id
      t.integer :position

      t.timestamps
    end
  end
end
