module Caffeine
  class ErrorsController < ApplicationController
    include Gaffe::Errors
    include Caffeine::ApplicationHelper

    # Make sure anonymous users can see the page
    skip_before_filter :authenticate_user!

    # Override 'error' layout
    layout 'caffeine/error'

    def show
      @favicon_path = favicon_path
      render "caffeine/errors/#{@rescue_response}", status: @status_code
    end
  end
end
