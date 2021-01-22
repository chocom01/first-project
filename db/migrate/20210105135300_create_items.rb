# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :user
      t.belongs_to :category
      t.string :name
      t.text :description
      t.float :price
      t.timestamps
    end
  end
end
