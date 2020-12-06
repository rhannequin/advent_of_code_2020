# frozen_string_literal: true

module AdventOfCode2020
  class Day6
    def part1
      groups
        .map { |group_answers| group_answers.delete("\n").chars.uniq.count }
        .sum
    end

    def part2
      common_positive_answers = groups.flat_map do |group_answers|
        group_answers
          .split("\n")
          .map { |answer| answer.chars }
          .inject { |a, b| a.intersection(b) }
      end

      common_positive_answers.size
    end

    private

    def groups
      raw_data.split(/\n{2,}/)
    end

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day6", "answers.txt")
      )
    end
  end
end
