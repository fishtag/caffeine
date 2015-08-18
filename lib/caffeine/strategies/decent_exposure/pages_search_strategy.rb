require 'decent_exposure'

module Caffeine
  class PagesSearchStrategy < ::DecentExposure::Strategy
    def resource
      model.where(%( lower(title) LIKE #{query} ))
    end

    private

    def query
      "%#{params[:search].mb_chars.downcase}%"
    end
  end
end
