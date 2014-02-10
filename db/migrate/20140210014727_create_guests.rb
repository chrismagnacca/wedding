class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string  :name
      t.string  :invitation_code
      t.integer :additional_guests
      t.integer :rsvp_id
    end
  end
end
