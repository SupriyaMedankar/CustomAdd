# frozen_string_literal: true

require 'spec_helper'
require_relative '../add'
require 'rspec/expectations'

RSpec.describe 'add' do
  it 'returns 0 for empty string' do
    expect(add("")).to eq 0
  end

  it "returns sum of numbers in string considering comma as delimiter" do
    expect(add("1")).to eq 1
    expect(add("1,2")).to eq 3
  end

  it "allow \n as delimiter" do
    expect(add("1,2\n3")).to eq 6
  end

  it "accepts delimeters other than comma" do
    expect(add("//;\n1;2;3")).to eq 6
  end

  it "throws error for negative numbers" do
    expect { add("1,-2,3") }.to raise_error(RuntimeError, "negatives not allowed: -2")
    expect { add("1,-2,3,-4") }.to raise_error(RuntimeError, "negatives not allowed: -2, -4")
  end
end