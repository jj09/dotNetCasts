module UsersHelper

  # Returns the Gravatar forthe given user.
  def gravatar_for(user, options = {size: 50} )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    link_to image_tag(gravatar_url, alt: user.name, class: 'gravatar'), gravatar_url, html_options = {target: '_blank'}
  end

end
