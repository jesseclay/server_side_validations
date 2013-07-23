class Event < ActiveRecord::Base
  validates :date, presence: true
  validates :organizer_name, presence: true
  validates :title, presence: true, uniqueness: true
  validates_format_of :organizer_email,:with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i

  validate :date_must_be_valid,
           :date_cannot_be_in_the_past

 def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
 end

  def date_must_be_valid
    if !date.present?
      errors.add(:date, "date must be formatted correctly")
    end
  end 
end