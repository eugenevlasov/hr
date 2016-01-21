class CreateCandidateSkillJoinTable < ActiveRecord::Migration
  def change
    create_join_table :candidates, :skills do |t|
      # t.index [:candidate_id, :skill_id]
      # t.index [:skill_id, :candidate_id]
    end
  end
end
