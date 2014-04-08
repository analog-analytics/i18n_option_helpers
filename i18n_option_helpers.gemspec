Gem::Specification.new do |s|
  s.name = 'i18n_option_helpers'
  s.version = '0.0.1'
  s.date = '2012-08-16'
  s.summary = "Helpers for using i18n scopes for translated key / value options"
  s.description = "Extends the functionality of I18n to allow easy use of scopes to be used as key / value" \
                + "options for forms and validation"
  s.authors = ["Jesse Garrison"]
  s.email = "jmgarrison@gmail.com"

  s.add_runtime_dependency 'i18n'

  s.add_development_dependency 'mocha'
  s.add_development_dependency 'shoulda'

  s.files = Dir["{lib|test}/**/*.rb"]
  s.homepage = "http://github.com/analoganalytics/selective_validation"
end
