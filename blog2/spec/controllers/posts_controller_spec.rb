require 'spec_helper'

describe PostsController do
	describe "Get #new" do
		it "responds successfully with an HTTP 200 status code" do
			get :new
			expect(response).to be_success
			expect(response.status).to eq(200)
		end

		it "renders the new template" do
			get :new
			expect(response).to render_template("new")
		end
	end

	describe "Create" do
		it "has a create action" do
			post :create, post: {:title => "01_first_post", :text => "hello world"}
		end
		
		it "redirects to show the post just created" do
		  post :create, post: {:title => "01_first_post", :text => "hello world"}
		  assert_redirected_to "/posts/1"
		end
	end
end
