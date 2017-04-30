class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.integer :gym_id, null: false
      t.integer :user_id, null: false
      t.boolean :primary_gym, default: false

      t.timestamp
    end
  end
end
