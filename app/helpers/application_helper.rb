module ApplicationHelper
  
  def gravatar_for(chef, options = {size: 80})                                  #definition of gravatar method used in recipes view file. chef object is passed into method
    gravatar_id = Digest::MD5::hexdigest(chef.email.downcase)                   #options: size gives it the ability to take a size specification. Sets gravatar_id
    size =  options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: chef.chefname, class: "gravatar")
  end
end
