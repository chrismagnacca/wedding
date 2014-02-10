class Guest < ActiveRecord::Base
  has_many :rsvps
end
