require 'spec_helper'

RSpec.configure do |c|
  c.use_transactional_examples = true
end

describe Post do
  it "can create new Post" do
    Post.create(:title => 'A post', :text => 'lalala')
    expect(Post.count).to eq 1
  end
  
  context "validates data" do
    it "passes with title:'First Post' and text:'Hello World'" do
      Post.create(:title => 'First Post', :text => 'Hello World')
      expect(Post.count).to eq 1
    end
    
    it "must have a title" do
      expect(Post.create(:text => "Hello World")).to have(2).errors_on(:title)
    end
    
    it "fails when title less than five characters" do
      expect(Post.create(:title => 'four', :text => 'Hello World')
      ).to have(1).errors_on(:title)
    end
  end
end
