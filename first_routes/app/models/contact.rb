class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: {scope: :user_id}

  belongs_to :owner, class_name: 'User'
  has_many :shares, class_name: 'ContactShare', foreign_key: :contact_id

  has_many :shared_users, through: :shares, source: :user

end
