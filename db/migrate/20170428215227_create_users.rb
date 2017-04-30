class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.integer :age, null: false
      t.string  :gender_pronoun, null: false
      t.string :phone, null: false
      t.attachment  :image
      t.string  :profile_bio, null: false

      t.timestamp
    end
  end
end
