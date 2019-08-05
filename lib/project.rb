class Project
  attr_accessor :title, :id
  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end
end
