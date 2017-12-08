require('spec_helper')

describe(Project) do

  describe("#initialize") do
    it("creates a new project object") do
      new_project = Project.new({:name => "project1", :id => nil})
      expect(new_project).to(be_an_instance_of(Project))
    end
  end

  describe("#name") do
      it("tells you its name") do
        new_project = Project.new({:name => "project1", :id => nil})
        expect(new_project.name()).to(eq("project1"))
      end
    end

  describe(".all") do
    it("starts off with no projects on list") do
      expect(Project.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("lets you save project to the database") do
      new_project = Project.new({:name => "project1", :id => nil})
      new_project.save()
      expect(Project.all()).to(eq([new_project]))
    end
  end

  describe("#==") do
    it("is the same project if it is the same name") do
      new_project1 = Project.new({:name => "project1", :id => nil})
      new_project2 = Project.new({:name => "project1", :id => nil})
      expect(new_project1).to(eq(new_project2))
    end
  end

  describe(".find") do
    it("returns a project by its ID") do
      new_project1 = Project.new({:name => "project1", :id => nil})
      new_project1.save()
      new_project2 = Project.new({:name => "project2", :id => nil})
      new_project2.save()
      expect(Project.find(new_project1.id())).to(eq(new_project1))
    end
  end

  describe("#update") do
    it("lets you update project in the database") do
      new_project1 = Project.new({:name => "my_project", :id => nil})
      new_project1.save()
      new_project1.update({:name => "project1"})
      expect(new_project1.name()).to(eq("project1"))
    end
  end

  describe("#delete") do
    it("lets you delete a project from the database") do
      new_project1 = Project.new({:name => "project1", :id => nil})
      new_project1.save()
      new_project2 = Project.new({:name => "project2", :id => nil})
      new_project2.save()
      new_project1.delete()
      expect(Project.all()).to(eq([new_project2]))
    end
  end

end
