# frozen_string_literal: true

describe AdventOfCode2020::Day2 do
  let(:subject) { described_class.new }

  let(:data) do
    entries = [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc",
    ]
    StringIO.new(entries.join("\n"))
  end

  before { allow(File).to receive(:read).and_return(data.read) }

  describe "#part1" do
    it "returns the number of valid passwords" do
      expect(subject.part1).to eq(2)
    end
  end

  describe "#part2" do
    it "eturns the number of valid passwords" do
      expect(subject.part2).to eq(1)
    end
  end
end
