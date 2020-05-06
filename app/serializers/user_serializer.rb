class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :notes

  # Serialize the notes more than one level deep (i.e. to include serialized tags)
  def notes
    ActiveModelSerializers::SerializableResource.new(object.notes,  each_serializer: NoteSerializer)
  end

end
