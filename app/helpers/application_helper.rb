module ApplicationHelper
  include MeetingsHelper
  def customjs(*files)
    content_for(:head_js) { javascript_include_tag(*files) }
  end
end
