namespace :db do
  desc 'generate invitation codes'
  task load: :environment do
    process_guest_list
  end
end

require 'csv'

def process_guest_list
  codes = []
  (0..150).each { |n| codes.push({code: SecureRandom.hex(3).to_s.upcase, envelope: n }) }

  codes.each { |code| Guest.create({invitation_code: code[:code],envelope_number: code[:envelope]}) }

end

def dump_guest_list
  body = Guest.all.to_a.inject([]) { |result, e| result.push("#{e.invitation_code},#{e.envelope_number},#{e.meal_order},#{e.number_attending},#{e.rsvp}")}
  Guest.all.each do |guest|

  end
end
