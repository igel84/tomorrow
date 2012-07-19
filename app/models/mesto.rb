class Mesto < ActiveRecord::Base
  has_many :pokazs
  has_many :pages, :through => :pokazs
end
