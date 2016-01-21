module CandidatesHelper
  def show_skills(skills)
    return "" if !skills || skills.empty?
    skills_html = ""
    skills.each do |s|
      skills_html << content_tag(:div, s[:name])
    end
    skills_html.html_safe
  end
end
