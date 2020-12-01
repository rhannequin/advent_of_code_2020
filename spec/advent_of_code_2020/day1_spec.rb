# frozen_string_literal: true

describe AdventOfCode2020::Day1 do
  let(:subject) { described_class.new }

  let(:data) do
    entries = [1721, 979, 366, 299, 675, 1456]
    StringIO.new(entries.join("\n"))
  end

  before { allow(File).to receive(:read).and_return(data.read) }

  describe "#part1" do
    it "returns the expected product" do
      expect(subject.part1).to eq(514579)
    end
  end

  describe "#part2" do
    it "returns the expected product" do
      expect(subject.part2).to eq(241861950)
    end
  end
end
