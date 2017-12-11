class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :website
      t.string :menu

      t.timestamps
    end
  end
end
