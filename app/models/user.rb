class User < ActiveRecord::Base
  has_many :collaboratings, :dependent => :destroy
  has_many :collaborated_projects, :through => :collaboratings, :source => :project
end
