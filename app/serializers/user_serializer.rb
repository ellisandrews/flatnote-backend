class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :notes

  def notes
    ActiveModelSerializers::SerializableResource.new(object.notes,  each_serializer: NoteSerializer)
    # ActiveModel::SerializableResource.new(object.notes,  each_serializer: NoteSerializer)
  end

end
