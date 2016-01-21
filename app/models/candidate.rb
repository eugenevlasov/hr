class Candidate < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_one :candidate_status, :primary_key => :status
  validates :name, presence: true, length: {minimum: 3}, format: {with: /\A[А-ЯЁа-яё]+\z/}
  validates :fee, presence: true
  enum status: {worker: 0, candidate: 1, opened_for_invation: 2 }
  scope :active_and_passive, -> {where(status: [statuses[:worker], statuses[:candidate], statuses[:opened_for_invation]])}
  scope :active, -> {where(status:  [statuses[:candidate], statuses[:opened_for_invation]])}
  scope :passive, -> {where(status: statuses[:worker])}
end