require 'spec_helper'

describe 'posts/index' do
  context 'base page' do
    before(:each) do
      assign(:posts, [stub_model(Post)])
    end
    
    it 'has a title describing what the page does' do
      render
      expect(rendered).to have_css("h1")
      expect(rendered).to include("<h1>Listing Posts</h1>")
    end
    
    it 'contains a table' do
      render
      expect(rendered).to have_css("table")
    end
    
    it 'contains a link to create a new post' do
      render
      rendered.should have_link("New post", :href => new_post_path)
    end
  end
  
  context 'with 2 posts' do
    before(:each) do
      assign(:posts, [
        stub_model(Post, :title => "01", :text => "First"),
        stub_model(Post, :title => "02", :text => "Second")
      ])
    end
    
    it "displays both posts" do
      render
      
      expect(rendered).to include("01")
      expect(rendered).to include("02")
    end
    
    it "has a link to view the post" do
      render
      
      rendered.should have_link("Show", :href => post_path({:id => "1"}))
    end
  end
  
  
end
