# frozen_string_literal: true

require "bridgetown-core"
require "action_view"

# Remove this when https://github.com/ViewComponent/view_component/pull/2462 is merged and released.
unless defined?(Rails)
  module Rails
    def self.version
      ActionView.version.to_s
    end

    module VERSION
      MAJOR = Rails.version.split(".")[0].to_i
      MINOR = Rails.version.split(".")[1].to_i
    end

    def self.application
      nil
    end

    def self.env
      @env ||= Bridgetown.environment
    end
  end
end

require "view_component"

# Load classes/modules

module Bridgetown
  module ViewComponent
  end

  autoload :ViewComponentHelpers,
           "bridgetown-view-component/bridgetown/view_component_helpers"
  autoload :ComponentValidation,
           "bridgetown-view-component/bridgetown/component_validation"
end

Bridgetown.initializer :"bridgetown-view-component" do |config|
  config.source_manifest(
    origin: Bridgetown::ViewComponent,
    components: File.expand_path("../components", __dir__)
  )

  # Add a few methods to Bridgetown's Ruby template superclasses
  [Bridgetown::RubyTemplateView, Bridgetown::Component].each do |klass|
    klass.class_eval do
      def lookup_context
        HashWithDotAccess::Hash.new(variants: [])
      end

      def output_buffer
        ActionView::OutputBuffer.new
      end

      def view_renderer
        nil
      end

      def view_flow
        nil
      end
    end
  end
end
