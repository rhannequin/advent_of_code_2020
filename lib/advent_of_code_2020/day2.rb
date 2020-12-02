# frozen_string_literal: true

module AdventOfCode2020
  class Day2
    class PasswordPolicy
      OLD_POLICY = :old
      NEW_POLICY = :new

      ENTRY_MATCH = /^(\d+)-(\d+) (\w): (\w+)$/.freeze

      def initialize(entry)
        scan = entry.scan(ENTRY_MATCH).first
        @policy_start, @policy_end, @policy_character, @password = scan
      end

      def valid?(version:)
        case version
        when OLD_POLICY
          @password
            .count(@policy_character)
            .between?(@policy_start.to_i, @policy_end.to_i)
        when NEW_POLICY
          (includes_char_at?(@policy_start)) ^ (includes_char_at?(@policy_end))
        end
      end

      private

      def includes_char_at?(at)
        @password[at.to_i - 1] == @policy_character
      end
    end

    def initialize
      @entries = raw_data.split("\n")
    end

    def part1
      complete(PasswordPolicy::OLD_POLICY)
    end

    def part2
      complete(PasswordPolicy::NEW_POLICY)
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day2", "passwords.txt")
      )
    end

    def complete(policy_version)
      @entries
        .select { |entry| PasswordPolicy.new(entry).valid?(version: policy_version) }
        .count
    end
  end
end
