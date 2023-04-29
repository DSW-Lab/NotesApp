class User < ApplicationRecord

  has_secure_password

  has_many :notes
  has_many :note_collections
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :shares
  has_many :shared_notes, through: :shares, source: :shareable, source_type: 'Note'
  has_many :shared_note_collections, through: :shares, source: :shareable, source_type: 'NoteCollection'

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  
  def admin?
    role == 'admin'
  end
    

end
