class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def initialize(...)
    super
    @date = Time.now.strftime("%B %d, %Y")
  end
end
