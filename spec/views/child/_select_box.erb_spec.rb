require 'spec_helper'

describe "children/_select_box.html.erb" do
  before :each do
    @child = Child.new("_id" => "id12345", "name" => "First Last", "new field" => "")
    assigns[:child] = @child
  end

  it "should include image for tooltip when help text exists" do
    select_box = Field.new :name => "new field",
    :display_name => "field name",
    :type => 'select_box',
    :option_strings => Array['M', 'F'],
    :help_text => "This is my help text"

    render :partial => 'children/select_box.html.erb', :locals => { :select_box => select_box}

    rendered.should be_include("<img class=\"tool-tip-icon vtip\"")
  end

  it "should not include image for tooltip when help text not exists" do
    select_box = Field.new :name => "new field",
    :display_name => "field name",
    :type => 'select_box',
    :option_strings => Array['M', 'F']

    render :partial => 'children/select_box.html.erb', :locals => { :select_box => select_box}

    rendered.should_not be_include("<img class=\"tool-tip-icon vtip\"")
  end

end
