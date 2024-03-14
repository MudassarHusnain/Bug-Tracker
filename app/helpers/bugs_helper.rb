module BugsHelper
  def developer_options
    User.where(user_type: 'developer').pluck(:email, :id)
  end

  def projects
    Project.all.pluck(:name, :id)
  end

end