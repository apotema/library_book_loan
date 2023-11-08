class ApplicationController < ActionController::Base
  delegate :member, to: :current_user
end
