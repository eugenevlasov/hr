class VacanciesController < ApplicationController
  def show
    @vacancies = Vacancy.where("expire_at > '#{Time.now}' or expire_at is null")
  end
  def edit
    @vacancy = Vacancy.find(params[:id])
  end
  def update
    vancancy = Vacancy.find(params[:id])
    vancancy.update_attributes(vacancy_params)
    unless vancancy.valid?
      @errors = vancancy.errors.full_messages
    end
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
end
