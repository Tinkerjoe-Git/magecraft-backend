class MtgSetSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :release_date
end
