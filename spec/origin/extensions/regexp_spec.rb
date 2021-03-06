require "spec_helper"

describe Regexp do

  describe ".evolve" do

    context "when provided a regexp" do

      let(:regexp) do
        /^[123]/
      end

      let(:evolved) do
        described_class.evolve(regexp)
      end

      it "returns the regexp" do
        evolved.should eq(regexp)
      end
    end

    context "when provided a string" do

      let(:regexp) do
        "^[123]"
      end

      let(:evolved) do
        described_class.evolve(regexp)
      end

      it "returns the converted regexp" do
        evolved.should eq(/^[123]/)
      end
    end

    context "when provided an array" do

      context "when the elements are regexps" do

        let(:regexp) do
          /^[123]/
        end

        let(:evolved) do
          described_class.evolve([ regexp ])
        end

        it "returns the regexps" do
          evolved.should eq([ regexp ])
        end
      end

      context "when the elements are strings" do

        let(:regexp) do
          "^[123]"
        end

        let(:evolved) do
          described_class.evolve([ regexp ])
        end

        it "returns the regexps" do
          evolved.should eq([ /^[123]/ ])
        end
      end
    end
  end

  describe "#regexp?" do

    let(:regexp) do
      /^[123]/
    end

    it "returns true" do
      regexp.should be_regexp
    end
  end
end
