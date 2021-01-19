class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.references :reviewable, polymorphic: true
      t.float :review_rate
      t.text :review_text
      t.timestamps
    end
  end
end
