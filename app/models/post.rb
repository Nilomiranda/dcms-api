class Post < ApplicationRecord
  before_save :default_values
  belongs_to :user

  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :content, presence: true, length: { minimum: 1 }

  def default_values
    self.published = false if self.published.nil?
  end
end
