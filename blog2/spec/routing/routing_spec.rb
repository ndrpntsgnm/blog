require 'spec_helper'

describe "Default routing" do
	it "routes welcome/index to welcome#index" do
		expect(:get => "/welcome/index").to route_to(
			:controller => "welcome",
			:action => "index"
		)
	end

	it "routes root to welcome#index" do
		expect(:get => "/").to route_to(
			:controller => "welcome",
			:action => "index"
		)
	end

	it "routes /posts/new to posts#new" do
		expect(:get => "/posts/new").to route_to(
			:controller => "posts",
			:action => "new"
		)
	end
	
	it "routes /posts/:id(.:format) to posts#show" do
	  expect(:get => "/posts/1").to route_to(
	     :controller => "posts",
	     :action => "show",
	     :id => "1"
	  )
	end
	
	it "routes /posts to posts#index" do
	  expect(:get => "/posts").to route_to(
	     :controller => "posts",
	     :action => "index"
	  )
	end

	it "routes /posts/edit/:id to posts#edit" do
	  expect(:get => "/posts/edit/1").to route_to(
	     :controller => "posts",
	     :action => "edit",
	     :id => "1"
	  )
	end
end
