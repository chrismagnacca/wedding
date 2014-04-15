class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string  :name
      t.string  :envelope_code
      t.integer :primary_guests
      t.integer :additional_guests
      t.boolean :rsvp, default: false
    end
  end
end
