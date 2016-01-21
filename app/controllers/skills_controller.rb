class SkillsController < ApplicationController
  def create
    @skill = Skill.new(skill_params)
  end
  private
  def skill_params
    params.require(:skill).permit(:name)
  end
end
