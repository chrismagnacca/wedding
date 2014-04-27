namespace :db do
  desc 'generate invitation codes'
  task load: :environment do
    process_guest_list
  end

  task dump: :environment do
    dump_guest_list
  end
end

require 'csv'

def process_guest_list
  codes = []
  (0..150).each { |n| codes.push({code: SecureRandom.hex(3).to_s.upcase, envelope: n }) }
  codes.each { |code| Guest.create({invitation_code: code[:code],envelope_number: code[:envelope]}) }
end

def dump_guest_list
  guests = Guest.all
  RsvpMailer.list_email(guests).deliver
end
