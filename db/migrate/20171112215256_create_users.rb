class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :nusp
      t.integer :restaurant
      t.integer :time
      t.integer :qrcode
      t.integer :exit

      t.timestamps
    end
  end
end
