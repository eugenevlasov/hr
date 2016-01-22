class VacanciesController < ApplicationController
  def show
    @vacancies = Vacancy.where("expire_at > '#{Time.now}' or expire_at is null")
  end
  def edit
    @vacancy = Vacancy.find(params[:id])
    @skills = Skill.all
    @skills.where!("id not in (#{@vacancy.skills.pluck(:id).join(',')})") unless @vacancy.skills.empty?
  end
  def update
    vancancy = Vacancy.find(params[:id])
    vancancy.update_attributes(vacancy_params)
    unless vancancy.valid?
      @errors = vancancy.errors.full_messages
    end
  end
  def remove_skill
    skills = Skill.where(id: skill_params)
    @vacancy = Vacancy.find(params[:id])
    @vacancy.skills.delete(skills)
    render nothing: true
  end

  def add_skill
    puts skill_params
    skills = Skill.where(id: skill_params)
    @vacancy = Vacancy.find(params[:id])
    skills.each do |s|
      @vacancy.skills << s if @vacancy.skills.where(id: s.id).empty?
    end
    @vacancy.save! if @vacancy.changed?
    return redirect_to edit_vacancies_path(id: @vacancy.id)
  end
  def create
    new_vacancy = vacancy_params
    new_vacancy[:added_at] = Time.now
    @vacancy = Vacancy.new(new_vacancy)
    unless @vacancy.valid?
      @errors = @vacancy.errors.full_messages
      return render action: :new
    else
      @vacancy.save
    end
    return redirect_to vacancies_path
  end
  def new
    @vacancy = Vacancy.new
  end
  private
  def vacancy_params
    params.require(:vacancy).permit(:name, :description, :contact_info, :fee, :expire_at)
  end
  def skill_params
    ids = params.require(:skills).fetch(:ids)
    if ids.kind_of?(Array)
      ids.collect { |s| s if s }
    else
      ids
    end
  end
end
