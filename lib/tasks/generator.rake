namespace :db do
  desc 'generate invitation codes'
  task load: :environment do
    process_guest_list
  end
end

require 'csv'

def process_guest_list
  CSV.foreach(File.dirname(__FILE__) + "/../data/guest_list.csv",  headers: true) do |row|
      Guest.create(
        name: row["name"],
        primary_guests: row["primary_guests"],
        additional_guests: row["additional"],
        invitation_code: SecureRandom.hex(12)
      )
  end
end

