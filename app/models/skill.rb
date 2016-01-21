class Skill < ActiveRecord::Base
  belongs_to :vacancy
  belongs_to :candidate
  validates :name, presence: true, length: {minimum: 2}
end
