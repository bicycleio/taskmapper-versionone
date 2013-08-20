require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "TaskMapper::Provider::Versionone::Ticket" do
  before(:all) do
    headers = headers_for('admin', 'admin')
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get '/Trial30/rest-1.v1/Data/Scope/1009', headers, fixture_for('Scope1009'), 200
      mock.get '/Trial30/rest-1.v1/Data/Story?where=Scope%3D%27Scope%3A1009%27', headers, fixture_for('Stories'), 200
      mock.get '/Trial30/rest-1.v1/Data/Story/1013?where=Scope%3D%27Scope%3A1009%27', headers, fixture_for('Story1013'), 200
    end
    @project_id = 1009
    @ticket_id = 1013
  end

  before(:each) do
    @taskmapper = TaskMapper.new(:versionone, :server => 'http://server/Trial30', :username => 'admin', :password => 'admin')
    @project = @taskmapper.project(@project_id)
    @klass = TaskMapper::Provider::Versionone::Ticket
  end

  it "should be able to load all tickets" do
    @project.tickets.should be_an_instance_of(Array)
    @project.tickets.first.should be_an_instance_of(@klass)
  end

  it "should be able to load all tickets based on an array of ids" do
    @tickets = @project.tickets([@ticket_id])
    @tickets.should be_an_instance_of(Array)
    @tickets.first.should be_an_instance_of(@klass)
    @tickets.first.id.should == @ticket_id
  end

  it "should be able to load all tickets based on attributes" do
    @tickets = @project.tickets(:id => @ticket_id)
    @tickets.should be_an_instance_of(Array)
    @tickets.first.should be_an_instance_of(@klass)
    @tickets.first.id.should == @ticket_id
  end

  it "should return the ticket class" do
    @project.ticket.should == @klass
  end

  it "should be able to load a single ticket" do
    @ticket = @project.ticket(@ticket_id)
    @ticket.should be_an_instance_of(@klass)
    @ticket.id.should == @ticket_id
  end

  it "should be able to load a single ticket based on attributes" do
    @ticket = @project.ticket(:id => @ticket_id)
    @ticket.should be_an_instance_of(@klass)
    @ticket.id.should == @ticket_id
  end

  it "should be able to update and save a ticket" do
    pending("using posts in the api access")
    @ticket = @project.ticket(@ticket_id)
    #@ticket.save.should == nil
    @ticket.description = 'hello'
    @ticket.save.should == true
  end

  it "should be able to update a ticket to add a label and save the ticket" do
    pending("using posts in the api access")
    @ticket = @project.ticket(@ticket_id)
    @ticket.labels = 'sample label'
    @ticket.labels.should == 'sample label'
    @ticket.save.should == true
  end

  it "should be able to create a ticket" do
    pending("using posts in the api access")
    @ticket = @project.ticket!(:title => 'Ticket #12', :description => 'Body')
    @ticket.should be_an_instance_of(@klass)
  end

  it "should be able to load all tickets based on attributes using updated_at field" do
    @ticket = @project.ticket(@ticket_id)
    tickets = @project.tickets(:updated_at => @ticket.updated_at)
    tickets.should be_an_instance_of(Array)
    tickets.first.should be_an_instance_of(@klass)
  end

  it "shoule be able to load all tickets based on attributes using created_at field" do
    @ticket = @project.ticket(@ticket_id)
    tickets = @project.tickets(:created_at => @ticket.created_at)
    tickets.should be_an_instance_of(Array)
    tickets.first.should be_an_instance_of(@klass)
  end

  it "should return the requested_by field" do
    @ticket = @project.ticket(@ticket_id)
    @ticket.requestor.should == 'joe.user@example.com'
  end

  it "should be able to update a ticket" do
    pending("using posts in the api access")
    @ticket = @project.ticket(@ticket_id)
    @ticket.title = "Hello World"
    @ticket.save.should be_true
  end

  it "should have all contract fields for tickets" do
    @ticket = @project.ticket(@ticket_id)
    @ticket.title.should_not be_nil
    @ticket.description.should_not be_nil
    @ticket.status.should_not be_nil
    @ticket.priority.should_not be_nil
    @ticket.resolution.should_not be_nil
    @ticket.created_at.should_not be_nil
    @ticket.updated_at.should_not be_nil
    @ticket.assignee.should_not be_nil
    @ticket.requestor.should_not be_nil
    @ticket.project_id.should_not be_nil
  end

end