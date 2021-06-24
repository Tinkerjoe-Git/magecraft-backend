class UserSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :username, :password_digest, :email
end
