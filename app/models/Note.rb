class Note < ApplicationRecord

    # Asociación entre la nota y el usuario que la crea
    belongs_to :user
    has_many :collection_notes
    has_many :note_collections, through: :collection_notes
    has_many :shares, as: :shareable

    validates :title, presence: true
    validates :content, presence: true
    
end
