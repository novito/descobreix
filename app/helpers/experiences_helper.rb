module ExperiencesHelper
	# Checks if the current user is the one visiting a page that has a user id on it.
	def visitor_is_current_user? user_id
		return false if !user_signed_in? 
		if user_id.to_i == current_user.id
			return true
		else
			return false
		end
	end
end
