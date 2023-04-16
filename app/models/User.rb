class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
