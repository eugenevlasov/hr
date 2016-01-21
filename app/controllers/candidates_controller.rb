class CandidatesController < ApplicationController
  def show
    @statuses = Candidate.statuses
    @candidates = Candidate.active.includes(:skills)
  end

  def edit
    @statuses = Candidate.statuses
    @candidate = Candidate.find(params[:id])
    @skills = Skill.all
    @skills.where!("id not in (#{@candidate.skills.pluck(:id).join(',')})") unless @candidate.skills.empty?
  end

  def update
    candidate = Candidate.find(params[:id])
    candidate.update_attributes(candidate_params)
    unless candidate.valid?
      @errors = candidate.errors.full_messages
    end

  end

  def remove_skill
    skills = Skill.where(id: skill_params)
    @candidate = Candidate.find(params[:id])
    @candidate.skills.delete(skills)
    render nothing: true
  end

  def add_skill
    puts skill_params
    skills = Skill.where(id: skill_params)
    @candidate = Candidate.find(params[:id])
    skills.each do |s|
      @candidate.skills << s if @candidate.skills.where(id: s.id).empty?
    end
    @candidate.save! if @candidate.changed?
    return redirect_to edit_candidates_path(id: @candidate.id)
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :contacts, :fee, :status)
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
