class ApplicationController < ActionController::Base
  include Clearance::Controller
  @@skip_toys = 0
end
