# frozen_string_literal: true

describe AdventOfCode2020::Day5 do
  let(:subject) { described_class.new }

  let(:data) do
    entries = [
      "BFFFBBFRRR",
      "FFFBBBFRRR",
      "BBFFBBFRLL",
    ]
    StringIO.new(entries.join("\n"))
  end

  before { allow(File).to receive(:read).and_return(data.read) }

  describe "#part1" do
    it "returns the highest boarding pass ID" do
      expect(subject.part1).to eq(820)
    end
  end

  describe "#part2" do
    it "returns the highest boarding pass ID" do
      expect(subject.part2).to eq(120)
    end
  end
end
