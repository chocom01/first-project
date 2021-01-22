# frozen_string_literal: true

class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :value
      t.belongs_to :filter
      t.timestamps
    end
  end
end
