class User < ApplicationRecord

  has_many :notes
  has_many :note_collections
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :shares

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    
    validates :email, presence: true
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :password, presence: true
    validates :confirmpassword, presence: false

  def admin?
    role == 'admin'
  end
    

end
