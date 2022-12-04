class Relationship < ApplicationRecord
　belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates_uniqueness_of :book_id, scope: :user_id
end
