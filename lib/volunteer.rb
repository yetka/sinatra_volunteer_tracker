class Volunteer
  attr_reader(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |city|
      name = city.fetch("name")
      id = city.fetch("id").to_i
      volunteers.push(City.new({:name => name, :id => id}))
    end
    volunteers
  end
end
