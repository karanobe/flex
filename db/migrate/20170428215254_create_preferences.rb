class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.string  :age_range, null: false
      t.string  :gender, null: false
      t.integer :user_id, null: false

      t.timestamp
    end
  end
end
