class Note < ApplicationRecord

    belongs_to :user
    belongs_to :note_collection, optional: true
    has_many :shares, dependent: :destroy
end
