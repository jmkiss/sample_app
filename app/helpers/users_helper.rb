module UsersHelper
	# Returns  the gravatar (Http://gravatar.com/) for the given user.
	def gravatar_for(user)
		gravatar_id = Digest::MDS::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatars/#{gravatar_id}.png"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
end 

