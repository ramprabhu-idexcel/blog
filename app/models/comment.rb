class Comment
  include Mongoid::Document
  field :content, type: String
  field :commentable_id, type: Integer
  field :commentable_type, type: String

  belongs_to :commentable, :polymorphic => true
end
