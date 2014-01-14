require 'spec_helper'

describe PostsController do
	describe "New" do
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
		it "exists" do
			post :create, post: {:title => "01_first_post", :text => "hello world"}
		end
		
		it "redirects to show the post just created" do
		  post :create, post: {:title => "01_first_post", :text => "hello world"}
		  assert_redirected_to "/posts/1"
		end
		
		context "renders the 'new' template when trying to save an invalid post, and display error" do
		  it "with missing title" do
		    post :create, post: {:text => "hello world"}
		    expect(response).to render_template(:new)
		  end
		  
		  it "with title too short" do
		    post :create, post: {:title => "four", :text => "hello world"}
		    expect(response).to render_template(:new)
		  end
		end
	end
	
	describe "Index" do
	  it "exists" do
	    get :index
	    expect(response).to be_success
	  end
	  
	  it "renders the index template" do
	    get :index
	    expect(response).to render_template("index")
	    expect(response).to be_success
	  end
	  
	  it "uses @posts to hold all post records" do
	    get :index
	    assigns(:posts).should be_kind_of(ActiveRecord::Relation)
	  end
	end
	
	describe "Show" do
	  before(:each) do
	    @post1 = Post.new(:title => "first", :text => "hello")
      @post1.save
	  end
	  
	  it "exists and renders the show template" do
	    get :show, {:id => @post1.id}
      expect(response).to render_template("show")
      expect(response).to be_success
	  end
	end

	describe "Edit" do
	  before(:each) do
	    @post1 = Post.new(:title => "first", :text => "hello")
	    @post1.save
	  end

	  it "exists" do
	    get :edit, {:id => @post1.id}
	    expect(response).to be_success
	  end
	  
	  it "renders the edit template" do
	    get :edit, {:id => @post1.id}
	    expect(response).to render_template("edit")
      expect(response).to be_success
	  end
	end
	
	describe "Update" do
	  before(:each) do
	    @post1 = Post.new(:title => "first", :text => "hello")
      @post1.save
	  end
	  
	  it "exists" do
	    post :update, {:id => @post1.id, post: {:title => "edited title", :text => "edited text"}}
	  end
	  
	  it "redirects to the updated post" do
	    post :update, {:id => @post1.id, post: {:title => "edited title", :text => "edited text"}}
	    assert_redirected_to "/posts/%s" % @post1.id.to_s
	  end
	  
	  it "renders edit template with bad data" do
	    post :update, {:id => @post1.id, post: {:title => "a"}}
	    expect(response).to render_template("edit")
	  end
	end
end
