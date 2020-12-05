# frozen_string_literal: true

module AdventOfCode2020
  class Day5
    class BoardingPass
      def initialize(code)
        @raw_code = code.slice(...7)
        @column_code = code.slice(7..-1)
      end

      def id
        raw_id * 8 + column_id
      end

      private

      def compute_id(map_code, highest_id, lower_char, higher_char)
        range = (0..highest_id).to_a
        map_code.split("").each do |char|
          if char == lower_char
            range = range.slice(0, (range.size / 2))
          elsif char == higher_char
            range = range.slice((range.size / 2), range.size)
          end
        end
        range.first
      end

      def raw_id
        compute_id(@raw_code, 127, "F", "B")
      end

      def column_id
        compute_id(@column_code, 7, "L", "R")
      end
    end

    def initialize
      @entries = raw_data.split("\n")
    end

    def part1
      @entries.map { |entry| BoardingPass.new(entry).id }.max
    end

    def part2
      boarding_pass_ids = @entries.map { |entry| BoardingPass.new(entry).id }
      (
        (boarding_pass_ids.min..boarding_pass_ids.max).to_a - boarding_pass_ids
      ).first
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day5", "boarding_passes.txt")
      )
    end
  end
end
