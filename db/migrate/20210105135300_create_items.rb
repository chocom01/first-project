class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :user
      t.string :name
      t.text :description
      t.float :price
      t.timestamps
    end
  end
end
