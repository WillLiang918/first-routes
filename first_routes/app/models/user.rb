class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts, dependent: :destroy
  has_many :shares, class_name: "ContactShare", foreign_key: :user_id,
    primary_key: :id, dependent: :destroy

  has_many :shared_contacts, through: :shares, source: :contact

  def all_my_contacts
    self.contacts.to_a + self.shared_contacts.to_a
  end
end
