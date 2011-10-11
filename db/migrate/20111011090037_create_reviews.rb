class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.date :start_on
      t.date :end_on

      t.timestamps
    end
  end
end
