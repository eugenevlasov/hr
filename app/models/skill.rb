class Skill < ActiveRecord::Base
  belongs_to :vacancy
  belongs_to :candidate
end
