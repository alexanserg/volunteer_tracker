class Volunteer
  attr_accessor :name, :project_id, :id
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def ==(volunteer)
    @name == volunteer.name
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.all
    returned = DB.exec("SELECT * FROM volunteers ORDER BY name;")
    volunteers = []
    returned.each() do |person|
      name = person.fetch("name")
      project_id = person.fetch("project_id").to_i
      id = person.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    if volunteer
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      id = volunteer.fetch("id").to_i
      Volunteer.new({:name => name, :project_id => project_id, :id => id})
    else
      nil
    end
  end


  def self.clear
    DB.exec("DELETE FROM volunteers *;")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
  end
end
