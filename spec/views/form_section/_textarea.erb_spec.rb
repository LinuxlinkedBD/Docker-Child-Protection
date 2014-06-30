require 'spec_helper'

describe "form_section/_textarea.html.erb" do
  before :each do
    @child = Child.new("_id" => "id12345", "name" => "First Last", "new field" => "")
    assigns[:child] = @child
  end

  it "should include image for tooltip when help text exists" do
    textarea = Field.new :name => "new field",
    :display_name => "field name",
    :type => 'textarea',
    :help_text => "This is my help text"

    render :partial => 'form_section/textarea', :locals => { :textarea => textarea, :formObject => @child}, :formats => [:html], :handlers => [:erb]
    rendered.should have_tag("img.vtip")
  end

  it "should not include image for tooltip when help text not exists" do
    textarea = Field.new :name => "new field",
    :display_name => "field name",
    :type => 'textarea'

    render :partial => 'form_section/textarea', :locals => { :textarea => textarea, :formObject => @child}, :formats => [:html], :handlers => [:erb]
    rendered.should_not have_tag("img.vtip")
  end

end