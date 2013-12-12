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
  end
  
  
end
