class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.integer  :min_age, null: false
      t.integer :max_age, null: false
      t.string  :gender, null: false
      t.integer :user_id, null: false

      t.timestamp
    end
  end
end
