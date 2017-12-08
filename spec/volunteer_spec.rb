require('spec_helper')

describe(Volunteer) do

  describe("#initialize") do
    it("create a new volunteer object") do
      new_volunteer = Volunteer.new({:name => "Malgorzata Haniszewska", :project_id => nil})
      expect(new_volunteer).to(be_an_instance_of(Volunteer))
    end
  end

  describe(".all") do
    it("is empty in the beginning") do
      expect(Volunteer.all).to(eq([]))
    end
  end
  #
  describe("#save") do
    it("allows you to save volunteer to the database") do
      new_volunteer = Volunteer.new({:name => "Malgorzata Haniszewska", :project_id => nil})
      new_volunteer.save
      expect(Volunteer.all).to(eq([new_volunteer]))
    end
  end

  describe("#==") do
    it("is the same volunteer if it has the same name") do
      volunteer1 = Volunteer.new({:name => "Malgorzata Haniszewska", :project_id => nil})
      volunteer2 = Volunteer.new({:name => "Malgorzata Haniszewska", :project_id => nil})
      expect(volunteer1).to(eq(volunteer2))
    end
  end

end
