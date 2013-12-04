require 'spec_helper'

describe "welcome/index.html.erb" do
  it "displays a welcome message" do
	  render
	  expect(rendered).to include("Welcome")
  end

  it "displays hello world" do
	  render
	  expect(rendered).to include("Hello World")
  end
end
