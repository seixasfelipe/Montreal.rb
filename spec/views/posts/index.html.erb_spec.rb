require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :title => "Title",
        :content => "Content",
        :text => "",
        :tags => "Tags",
        :user_id => 1
      ),
      stub_model(Post,
        :title => "Title",
        :content => "Content",
        :text => "",
        :tags => "Tags",
        :user_id => 1
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
