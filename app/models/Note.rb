class Note < ApplicationRecord
    # Asociación entre la nota y el usuario que la crea
    belongs_to :user
end
