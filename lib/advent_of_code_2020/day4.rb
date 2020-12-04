# frozen_string_literal: true

module AdventOfCode2020
  class Day4
    class Passport
      class FieldBase
        SEPARATOR = ":"

        class << self
          def build(raw_field)
            name, value = raw_field.split(SEPARATOR)
            Passport::FIELD_CLASSES[name].new(name, value)
          end
        end

        attr_reader :name, :value

        def initialize(name, value)
          @name = name
          @value = value
        end

        def valid?
          raise NotImplemented
        end
      end

      class BirthYearField < FieldBase
        def valid?
          value.to_i.between?(1920, 2002)
        end
      end

      class IssueYearField < FieldBase
        def valid?
          value.to_i.between?(2010, 2020)
        end
      end

      class ExpirationYearField < FieldBase
        def valid?
          value.to_i.between?(2020, 2030)
        end
      end

      class HeightField < FieldBase
        UNITS = [
          CENTIMETER = "cm",
          INCH = "in",
        ]

        def valid?
          valid_format? && valid_value?
        end

        private

        def valid_format?
          value.match?(/^(\d{2,3})(#{UNITS.join("|")})$/i)
        end

        def valid_value?
          value
            .to_i
            .between?(*(value.include?(CENTIMETER) ? [150, 193] : [59, 76]))
        end
      end

      class HairColorField < FieldBase
        COLOR_IDENTIFIER = "#"

        def valid?
          value.match?(/^#{COLOR_IDENTIFIER}[a-f\d]{6}$/i)
        end
      end

      class EyeColorField < FieldBase
        VALID_COLORS = %w[amb blu brn gry grn hzl oth]

        def valid?
          VALID_COLORS.include?(value)
        end
      end

      class PassportIdField < FieldBase
        def valid?
          value.match(/^\d{9}$/)
        end
      end

      class CountryIdField < FieldBase
        def valid?
          true
        end
      end

      FIELDS = [
        BIRTH_YEAR = "byr",
        ISSUE_YEAR = "iyr",
        EXPIRATION_YEAR = "eyr",
        HEIGHT = "hgt",
        HAIR_COLOR = "hcl",
        EYE_COLOR = "ecl",
        PASSPORT_ID = "pid",
        COUNTRY_ID = "cid",
      ].freeze

      FIELD_CLASSES = {
        BIRTH_YEAR => BirthYearField,
        ISSUE_YEAR => IssueYearField,
        EXPIRATION_YEAR => ExpirationYearField,
        HEIGHT => HeightField,
        HAIR_COLOR => HairColorField,
        EYE_COLOR => EyeColorField,
        PASSPORT_ID => PassportIdField,
        COUNTRY_ID => CountryIdField,
      }.freeze

      MANDATORY_FIELS = [
        BIRTH_YEAR, ISSUE_YEAR, EXPIRATION_YEAR, HEIGHT,
        HAIR_COLOR, EYE_COLOR, PASSPORT_ID,
      ].freeze

      def initialize(raw)
        @raw = raw
      end

      def valid?
        MANDATORY_FIELS
          .map { |mandatory_field| !fields.find { |field| field.name == mandatory_field }.nil? }
          .all?
      end

      def strictly_valid?
        return false unless valid?

        MANDATORY_FIELS
          .map { |name| fields.find { |f| f.name == name }.valid? }
          .all?
      end

      private

      def fields
        @fields ||= begin
          @raw
            .split(/\s/)
            .map { |raw_field| FieldBase.build(raw_field) }
        end
      end
    end

    def initialize
      @passports = raw_data.split(/\n{2,}/).map do |raw_passport|
        Passport.new(raw_passport)
      end
    end

    def part1
      @passports.map(&:valid?).count(true)
    end

    def part2
      @passports.map(&:strictly_valid?).count(true)
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day4", "passports.txt")
      )
    end
  end
end
