class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string  :email_address, default: ""
      t.string  :guest_names, default: ""
      t.string  :invitation_code
      t.string  :envelope_number
      t.string  :meal_order, default: ""
      t.string  :number_attending, default: 0
      t.boolean :rsvp, default: false
    end
  end
end
