class ContactShare < ActiveRecord::Base
  validates :user, :contact, presence: true
  validates :user, uniqueness: { scope: :contact }

  belongs_to :user
  belongs_to :contact
end
