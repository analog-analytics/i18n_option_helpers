require_relative "../lib/i18n_option_helpers.rb"

require 'test/unit'
require 'shoulda-context'
require 'i18n'
require 'mocha/test_unit'

class I18nOptionHelpersTest < Test::Unit::TestCase
  context "options_for_select_from_scope" do
    should "return nil if no translations exist" do
      I18n.stubs(:t).with('some.missing.translation').returns("translation missing: en.some.missing.translation")
      assert_nil I18n.options_for_select_from_scope('some.missing.translation')

      I18n.stubs(:t).with('some.string.translation').returns("hello")
      assert_nil I18n.options_for_select_from_scope('some.string.translation')
    end

    should "return an array of [value, key] pairs" do
      I18n.stubs(:t).with('some.existing.translation').returns({key_1: "Key 1", key_2: "Key 2"})
      assert I18n.options_for_select_from_scope('some.existing.translation').select{ |x| !(x.is_a?(Array) && x.length == 2) }.empty?
    end

    should "return string key / value pairs as options" do
      I18n.stubs(:t).with('some.existing.translation').returns({key_1: "Key 1", key_2: "Key 2"})
      assert I18n.options_for_select_from_scope('some.existing.translation').select{ |x| !(x[0].is_a?(String) && x[1].is_a?(String)) }.empty?
    end
  end

  context "keys_from_scope" do
    should "return nil if no translations exist" do
      I18n.stubs(:t).with('some.missing.translation').returns("translation missing: en.some.missing.translation")
      assert_nil I18n.keys_from_scope('some.missing.translation')

      I18n.stubs(:t).with('some.string.translation').returns("hello")
      assert_nil I18n.keys_from_scope('some.string.translation')
    end

    should "return an array of strings" do
      I18n.stubs(:t).with('some.existing.translation').returns({key_1: "Key 1", key_2: "Key 2"})
      assert_same_elements %w(key_1 key_2), I18n.keys_from_scope('some.existing.translation')
    end
  end
end
