class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :guest_id
      t.integer :meal_id
      t.string  :name

      t.timestamps
    end
  end
end
