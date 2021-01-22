# frozen_string_literal: true

class CreateCategoriesFiltersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_filters, id: false do |t|
      t.belongs_to :category
      t.belongs_to :filter
    end
    # add_index :categories_filters, :category_id
    # add_index :categories_filters, :filter_id
  end
end
