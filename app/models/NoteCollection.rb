class NoteCollection < ApplicationRecord
    belongs_to :user
    has_many :notes, dependent: :destroy
    has_many :shares, dependent: :destroy
  end