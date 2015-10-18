assert = require "power-assert"

describe "Test", ->
  describe "#success", ->
    it "should success", ->
      assert "hoge" == "hoge"

  describe "#fail", ->
    it "should fail", ->
      assert "hoge" == "fuga"
