class Event < ActiveRecord::Base
  validates :date, presence: true
end



# Prevent Events from being saved when: a. The events date is empty, in the past, or is not valid. b. The events title is already taken or empty. c. The event organizers name is empty. d. The event organizers email address is invalid.
