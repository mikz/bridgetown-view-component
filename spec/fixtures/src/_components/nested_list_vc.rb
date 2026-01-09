# frozen_string_literal: true

class NestedListVc < ViewComponent::Base
  include Bridgetown::ViewComponentHelpers

  def initialize(items:)
    @items = items
  end

  erb_template <<~ERB
    Nested List:
    <ul>
      <% @items.each do |item| %>
        <li><%= render NestedItemVc.new(text: item) %></li>
      <% end %>
    </ul>
  ERB
end

