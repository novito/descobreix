module ExperiencesHelper
	# Checks if the current user is the one visiting a page that has a user id on it.
	def visitor_is_current_user? visitor
		return false if !user_signed_in? 
		if visitor == current_user
			return true
		else
			return false
		end
	end
end
