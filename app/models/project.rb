class Project < ActiveRecord::Base
  has_many :collaboratings, :dependent => :destroy
  has_many :collaborators, :through => :collaboratings, :source => :user
end
