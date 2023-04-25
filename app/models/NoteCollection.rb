class NoteCollection < ApplicationRecord

  belongs_to :user
  has_many :collection_notes
  has_many :notes, through: :collection_notes
  has_many :shares, as: :shareable

  validates :title, presence: true
  
  end