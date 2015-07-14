module Kernel
  def app_name
    Rails.application.class.parent_name
  end
end
