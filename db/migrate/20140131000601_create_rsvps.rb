class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :invitation_code
      t.string :primary_guest_name
      t.string :guest_name
      t.integer :meal_id
      t.boolean :primary_guest_attending
      t.boolean :guest_attending
    end
  end
endi
