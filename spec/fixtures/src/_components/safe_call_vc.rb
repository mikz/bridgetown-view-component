# frozen_string_literal: true

class SafeCallVc < ViewComponent::Base
  include Bridgetown::ViewComponentHelpers

  def call
    "<strong>Safe Call</strong>".html_safe
  end
end

