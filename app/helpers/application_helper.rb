module ApplicationHelper
  include MeetingsHelper

  def customjs(*files)
    content_for(:head_js) { javascript_include_tag(*files) }
  end
  
  def print_devise_errors(errors)
    unless errors.nil? 
      content = '<div class="alert alert-error"><ul>'
      errors.each { |value|  content += content_tag(:li, value) }
      content += '</ul></div>'
      content_for(:devise_errors) { content.html_safe }
    end
  end

end
