class ContentInfo < ActiveRecord::Base
  has_many :lesson_pages
  validates_uniqueness_of :name
  validates(:name, :presence => true)
end
