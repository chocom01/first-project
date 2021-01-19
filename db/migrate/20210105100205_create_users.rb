class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.belongs_to :city
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :address
      t.timestamps
    end
  end
end
