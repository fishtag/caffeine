module Kernel
  def app_name
    Rails.configuration.try(:custom_app_name) || Rails.application.class.parent_name
  end
end
