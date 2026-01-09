# frozen_string_literal: true

class HeaderComponent < ViewComponent::Base
  Bridgetown::ViewComponentHelpers.allow_rails_helpers :tag
  include Bridgetown::ViewComponentHelpers

  def call
    tag.h1 content, class: "my-8 text-3xl font-bold tracking-tight text-primary-white sm:text-4xl"
  end
end

