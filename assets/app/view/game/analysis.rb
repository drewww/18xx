# frozen_string_literal: true

require 'game_manager'
require 'lib/storage'

module View
  module Game
    class Analysis < Snabberb::Component
      include GameManager
      include Actionable

      needs :game, store: true

      def render
        h(:div, {}, 'Analyze!')
      end
    end
  end
end
