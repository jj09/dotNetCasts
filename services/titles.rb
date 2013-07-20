require "../config/environment.rb"
vodcasts = Vodcast.all
vodcasts.each do |v|
	puts v.title
end
