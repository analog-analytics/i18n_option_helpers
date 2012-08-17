require 'i18n'
I18n.class_eval do
  class << self
    def options_for_select_from_scope(scope)
      options = t(scope)
      return nil unless options.is_a? Hash
      options.map { |key, value| [value, key.to_s] }
    end

    def keys_from_scope(scope)
      options = t(scope)
      return nil unless options.is_a? Hash
      options.keys.map(&:to_s)
    end
  end
end