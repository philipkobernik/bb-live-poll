class Kitty < ActiveRecord::Base
  attr_accessible :lives, :name, :updated_at, :created_at
end
