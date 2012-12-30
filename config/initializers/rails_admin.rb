RailsAdmin.config do |config|
	config.authenticate_with do
  		current_user.admin?
	end
end