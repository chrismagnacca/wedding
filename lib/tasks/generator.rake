namespace :db do
  desc 'generate invitation codes'
  task load: :environment do
    process_guest_list
  end
end

require 'csv'

def process_guest_list
  CSV.foreach(
    File.dirname(__FILE__) + "/../data/guest_list.csv", 
    col_sep: ",",
    headers: true,
    header_converters: true) do |row|
      invitation_code = SecureRandom.hex(12)
      Guest.create(
      name: row["name"],
      additional_guests: row["additional"],
      invitation_code: invitation_code
    )
  end

end

