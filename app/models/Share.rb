class Share < ApplicationRecord
    belongs_to :user
    belongs_to :note, optional: true
    belongs_to :note_collection, optional: true
  end