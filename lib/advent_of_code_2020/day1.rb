# frozen_string_literal: true

module AdventOfCode2020
  class Day1
    SUM_MATCH = 2020

    def initialize
      @expenses = raw_data.split.map(&:to_i)
    end

    def part1
      complete(2)
    end

    def part2
      complete(3)
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day1", "expense_report.txt")
      )
    end

    def complete(combinations)
      @expenses
        .combination(combinations)
        .find { |combination| combination.sum == SUM_MATCH }
        .inject(&:*)
    end
  end
end
