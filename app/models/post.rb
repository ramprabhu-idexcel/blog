class Post
  include Mongoid::Document
  field :name, type: String
  field :title, type: String
  field :content, type: String

  has_many :comments, as: :commentable
end
