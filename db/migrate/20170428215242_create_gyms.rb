class CreateGyms < ActiveRecord::Migration[5.0]
  def change
    create_table :gyms do |t|
      t.string  :name, null: false
      t.string  :street_address, null: false
      t.string  :city, null: false
      t.string  :state, null: false
      t.integer :zip, null: false

      t.timestamp
    end
  end
end
