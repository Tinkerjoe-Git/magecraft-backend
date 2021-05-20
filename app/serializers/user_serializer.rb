class UserSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :name, :username, :password_digest, :email
end
