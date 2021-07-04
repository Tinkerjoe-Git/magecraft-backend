class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :decks
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  

  def generate_jwt
    JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end

  def jwt_payload
    super.merge('foo' => 'bar') 
  end

  def on_jwt_dispatch(_token, _payload)
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
