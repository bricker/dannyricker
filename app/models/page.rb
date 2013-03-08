class Page < ActiveRecord::Base
  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true
  
  def to_param
    self.slug
  end
end
