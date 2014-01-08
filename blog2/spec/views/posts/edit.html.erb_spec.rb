require 'spec_helper'
require 'capybara/node/actions'

describe "posts/edit" do
  before(:each) do
    @post = Post.new
  end
    
  it "contains a place to enter title" do
    render
    expect(rendered).to include("Title")
    response.body.should have_field("Title")
  end

  it "contains a place to enter text" do
    render
    expect(rendered).to include("Text")
    response.body.should have_field("Text")
  end

  it "contains a button to save the edited post" do
    render
    rendered.should have_css("input")
  end

  it "should post to the update action" do
    @post = Post.new(:title => "first", :text => "hello")
    @post.save
    render
    assert_select "form[action*=?]", "/posts/"+@post.id.to_s
  end
  
  it "contains a link to go back to /posts" do
    render
    rendered.should have_link("Back", posts_path)
  end
  
end
