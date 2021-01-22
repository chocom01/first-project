# frozen_string_literal: true

class AddCategoryToItem < ActiveRecord::Migration[6.0]
  def change
    change_table :items do |t|
      t.belongs_to :category
    end
  end
end
