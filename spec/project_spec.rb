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

    def self.all
      returned_projects = DB.exec("SELECT * FROM projects;")
      projects = []
      returned_projects.each do |project|
        name = project.fetch("name")
        id = project.fetch("id").to_i
        projects.push(Project.new({:name => name, :id => id}))
      end
      projects
    end

end
