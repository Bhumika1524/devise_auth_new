class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :description, presence: true, allow_blank: false
  belongs_to :user
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
end
