module ApplicationHelper

	def full_title(title_page)
		base_title = "Ruby On Rails Tutorial Sample App"
		if title_page.empty? 
			base_title
		else 
		"#{base_title} | #{title_page}"
	end 
end

end
