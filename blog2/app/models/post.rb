class Post < ActiveRecord::Base
  attr_accessor :title
  attr_accessor :text
  validates :title, presence: true, length:{minimum: 5}
end
