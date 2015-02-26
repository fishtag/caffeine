class CaffeineController < ApplicationController
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
