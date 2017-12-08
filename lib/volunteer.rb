class Volunteer
  attr_reader(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :id => id}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def ==(other_volunteer)
    self.name.==(other_volunteer.name).&(self.id.==(other_volunteer.id))
  end

  def self.find(id)
    found_volunteer = nil
    Volunteer.all.each do |volunteer|
      if volunteer.id.==(id)
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end
end
