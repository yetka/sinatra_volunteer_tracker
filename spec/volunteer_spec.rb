require('spec_helper')

describe(Volunteer) do

  describe("#initialize") do
    it("create a new volunteer object") do
      new_volunteer = Volunteer.new({:name => "Malgorzata Haniszewska", :id => nil})
      expect(new_volunteer).to(be_an_instance_of(Volunteer))
    end
  end

  describe(".all") do
    it("is empty in the beginning") do
      expect(Volunteer.all).to(eq([]))
    end
  end
end
