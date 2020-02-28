class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :text
      t.integer :evaluator_id
      t.integer :actor_id

      t.timestamps
    end
  end
end
