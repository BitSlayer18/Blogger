# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

#So that the class field or error is skipped and not create an issue
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end
