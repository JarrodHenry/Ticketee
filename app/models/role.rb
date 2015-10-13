class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.available_roles
    %w(manager editor viewer)
  end

  def role_on(project)
    roles.find_by(project_id: project).try(:name)
  end

end
