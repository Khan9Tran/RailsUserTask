class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :confirmation_token
  has_many :tasks
end
