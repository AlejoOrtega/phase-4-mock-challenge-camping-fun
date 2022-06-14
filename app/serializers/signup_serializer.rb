class SignupSerializer < ActiveModel::Serializer
  # attributes :activity
  belongs_to :activity
end
