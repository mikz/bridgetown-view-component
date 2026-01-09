# frozen_string_literal: true

class NestedItemVc < ViewComponent::Base
  include Bridgetown::ViewComponentHelpers

  def initialize(text:)
    @text = text
  end

  erb_template <<~ERB
    Nested Item: <%= @text %>
  ERB
end

