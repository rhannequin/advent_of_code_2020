# frozen_string_literal: true

describe AdventOfCode2020::Day6 do
  let(:subject) { described_class.new }

  let(:data) do
    entries = [
      "abc",
      "",
      "a",
      "b",
      "c",
      "",
      "ab",
      "ac",
      "",
      "a",
      "a",
      "a",
      "a",
      "",
      "b",
    ]
    StringIO.new(entries.join("\n"))
  end

  before { allow(File).to receive(:read).and_return(data.read) }

  describe "#part1" do
    it "returns the sum of positive answers" do
      expect(subject.part1).to eq(11)
    end
  end

  describe "#part2" do
    it "returns the sum of common positive answers" do
      expect(subject.part2).to eq(6)
    end
  end
end
