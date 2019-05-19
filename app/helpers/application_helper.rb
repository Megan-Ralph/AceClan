module ApplicationHelper
  def resource_name
     :user
   end

   def resource_class
      User
   end

   def resource
     @resource ||= User.new
   end

   def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
   end

   def icon_tag(klass, title = "")
     content_tag :i, nil, class: klass, title: title
   end

   def action_link_to(name, url, css_class, html_options = {})
    if html_options[:class].blank?
      html_options[:class] = 'go'
    end

    link_to url, html_options do
      icon_tag(css_class) << " " << name
    end
  end
end
