class ApplicationController < ActionController::Base
  serialization_scope :view_context
  protect_from_forgery
end
