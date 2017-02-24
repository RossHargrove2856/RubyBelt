class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  public
  def increment(attribute, by = 1)
	  self[attribute] ||= 0
	  self[attribute] += by
	  self
  end
end
