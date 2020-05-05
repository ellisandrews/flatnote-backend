class Note < ApplicationRecord
  belongs_to :user
  has_many :note_tags
  has_many :tags, through: :note_tags

  def tag_names=(names)
    # Takes an array of names of tags (existing or otherwise) and associates them with the Note
    self.tags = names.map do |name|
        name = name.strip.downcase   # Strip whitespace from the name and downcase it for storage
        Tag.where(name: name).first_or_create!
    end
  end

end
