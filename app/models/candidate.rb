class Candidate < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_one :candidate_status, :primary_key => :status
  validates :name, presence: true, length: {minimum: 3}, format: {with: /\A[А-ЯЁа-яё]+\z/}
  validates :fee, presence: true
  enum status: {worker: 0, candidate: 1, opened_for_invation: 2}
  scope :active_and_passive, -> { where(status: [statuses[:worker], statuses[:candidate], statuses[:opened_for_invation]]) }
  scope :active, -> { where(status: [statuses[:candidate], statuses[:opened_for_invation]]) }
  scope :passive, -> { where(status: statuses[:worker]) }

  def self.candidates_with_exact_skills(skills)
    candidates_ids = Candidate
                         .select(:id)
                         .group(:id)
                         .joins('inner join candidates_skills on candidates.id = candidates_skills.candidate_id')
                         .having("array_agg (candidates_skills.skill_id) @> ARRAY[#{skills.map { |k| k[:id] }.join(',')}]")
    Candidate
        .where(id: candidates_ids)
        .order(:fee)
  end

  def self.candidates_with_fuzzy_skills(skills)
    candidates_ids = Candidate
                         .select(:id)
                         .group(:id)
                         .joins('inner join candidates_skills on candidates.id = candidates_skills.candidate_id')
                         .having("array_agg (candidates_skills.skill_id) && ARRAY[#{skills.map { |k| k[:id] }.join(',')}]")
    Candidate
        .where(id: candidates_ids)
        .order(:fee)
  end
end