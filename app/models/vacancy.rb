class Vacancy < ActiveRecord::Base
  has_and_belongs_to_many :skills
  validates :name,:fee, :added_at, presence: true

end
