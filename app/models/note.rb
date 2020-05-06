class Note < ApplicationRecord
  belongs_to :user
  has_many :note_tags, dependent: :destroy 
  has_many :tags, through: :note_tags

  def tag_names=(names)
    # Takes an array of names of tags (existing or otherwise) and associates them with the Note
    self.tags = names.map do |name|
        name = name.strip.downcase   # Strip whitespace from the name and downcase it for storage
        Tag.where(name: name).first_or_create!
    end
  end

  def tag_names
    # Read tag names as a comma-separated string of title-cased names
    titleized_names = self.tags.map { |tag| tag.name.titleize }
    titleized_names.join(', ')
  end

end
