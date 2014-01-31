namespace :db do
  desc 'generate invitation codes'
  task generate: :environment do
    generate_invitation_codes
  end
end

def generate_invitation_codes

  200.times do |t|
    p SecureRandom.hex(12)
  end
end

