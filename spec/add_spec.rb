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
end