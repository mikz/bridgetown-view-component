# frozen_string_literal: true

class HelpersAccessVc < ViewComponent::Base
  include Bridgetown::ViewComponentHelpers

  erb_template <<~ERB
    <div class="<%= class_map(primary: true, secondary: false) %>">
      <%= markdownify "**From Bridgetown helper**" %>
    </div>
  ERB
end

