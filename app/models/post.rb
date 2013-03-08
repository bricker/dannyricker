class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end
end
