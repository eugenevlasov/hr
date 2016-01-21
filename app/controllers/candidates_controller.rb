class CandidatesController < ApplicationController
  def show
    puts Candidate.statuses
    @candidates = Candidate.active.includes(:skills)
  end
  def edit
    @candidate = Candidate.find(params[:id])
  end
  def update
    candidate = Candidate.find(params[:id])
    candidate.update_attributes(candidate_params)
    unless candidate.valid?
      @errors = candidate.errors.full_messages
    end

  end
  private
  def candidate_params
    params.require(:candidate).permit(:name, :contacts, :fee, :status)
  end
end
