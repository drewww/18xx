# frozen_string_literal: true

module Engine
  # Information about an players status
  class PlayerInfo
    attr_reader :round_name, :turn, :round_no, :value, :player_value_detail

    def initialize(round_name, turn, round_no, player_value, player_value_detail=[])
      @round_name = round_name
      @turn = turn
      @round_no = round_no
      @value = player_value

      #stores a map of value sources, e.g. cash, shares, debt
      @player_value_detail = player_value_detail
    end

    def round
      if %w[AR MR OR].include?(round_name)
        "#{round_name} #{turn}.#{round_no}"
      else
        "#{round_name} #{turn}"
      end
    end
  end
end
