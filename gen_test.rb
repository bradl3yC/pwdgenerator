require 'minitest/autorun'
require_relative "gen"

describe Password, "Password Generator" do

  let(:password) { Password.new}

  it "#generate" do
    password.generate.length.must_equal 10
  end

  it "should not start with a special character" do
    alphabet = "abcdefghijklmnopqrstuvwxyz1234567890".split ""
    alphabet.must_include password.generate[0]
  end

  it "should not contain successive repeating characters" do
    characters = password.generate
    characters = characters.split ""
    (0..characters.length).each do |i|
      characters[i].wont_match characters[i+1]
    end
  end

end
