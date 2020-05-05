class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  belongs_to :user
  has_many :tags
end
