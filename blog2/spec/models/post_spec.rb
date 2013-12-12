require 'spec_helper'

RSpec.configure do |c|
  c.use_transactional_examples = true
end

describe Post do
  it "can create new Post" do
    Post.create
    expect(Post.count).to eq 1
  end
end
