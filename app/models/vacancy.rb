class Vacancy < ActiveRecord::Base
  has_and_belongs_to_many :skills
  validates :name,:fee, :added_at, presence: true
  default_scope {order(:fee).reverse_order}
  def self.vacancies_with_exact_skills(skills)
    vacancies_ids = Vacancy
                        .select(:id)
                        .group(:id)
                        .joins('inner join skills_vacancies on vacancies.id = skills_vacancies.vacancy_id')
                        .having("array_agg (skills_vacancies.skill_id) @> ARRAY[#{skills.map{|k| k[:id] }.join(',')}]")
    Vacancy
        .where(id: vacancies_ids)
        .order(:fee)
        .reverse_order
  end
  def self.vancancies_with_fuzzy_skills(skills)
    vacancies_ids = Vacancy
                        .select(:id)
                        .group(:id)
                        .joins('inner join skills_vacancies on vacancies.id = skills_vacancies.vacancy_id')
                        .having("array_agg (skills_vacancies.skill_id) && ARRAY[#{skills.map{|k| k[:id] }.join(',')}]")
    Vacancy
        .where(id: vacancies_ids)
        .order(:fee)
        .reverse_order
  end
end
