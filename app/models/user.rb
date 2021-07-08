class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :decks
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  

  def generate_jwt(payload)
    JWT.encode(payload, ENV[DEVISE_JWT_SECRET_KEY])
  end

  def jwt_payload
    super
  end

  def on_jwt_dispatch(_token, _payload)
    super
  end

  def self.create_admin
    if !self.find_by(name: 'admin')
      User.create(name: "admin", password: "1234", admin: true)
      puts "Admin account created"
    else
      puts "An Admin account already exists"
    end
  end
end
