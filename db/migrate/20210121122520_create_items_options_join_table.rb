# frozen_string_literal: true

class CreateItemsOptionsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :items_options, id: false do |t|
      t.belongs_to :item
      t.belongs_to :option
    end
    # add_index :items_options, :item_id
    # add_index :items_options, :option_id
  end
end
