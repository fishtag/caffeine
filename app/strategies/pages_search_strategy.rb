module Caffeine
  class PagesSearchStrategy < ::DecentExposure::Strategy
    def resource
      model.where('lower(title) LIKE ?', '%' + params[:search].mb_chars.downcase.to_s + '%')
    end
  end
end
