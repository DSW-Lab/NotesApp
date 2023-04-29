class Share < ApplicationRecord
  belongs_to :user
  belongs_to :shareable, polymorphic: true
  belongs_to :shared_with, class_name: 'User'

  validates :shared_with, presence: true
end
