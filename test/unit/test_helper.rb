if ENV['CODE_COVERAGE']
  require 'simplecov'

  SimpleCov.start do
    add_filter '/bin/'
    add_filter '/test/'
  end
end

require 'minitest/autorun'
require 'minitest/reporters'
require 'ostruct'

# MIMIC ENV LOAD_PATHS
load_paths = []

app_root = File.expand_path("../../../", __FILE__)
load_paths += Dir[File.expand_path("#{app_root}/{app/models,lib}")]

load_paths.each do |load_path|
  $LOAD_PATH.unshift(load_path) unless $LOAD_PATH.include?(load_path)
end

# MINITEST REPORTERS
if ENV['JENKINS_HOME']
  ci_reports_folder = ENV['CI_UNIT_REPORTS'] || 'tmp/reports_for_jenkins/unit_tests'
  Minitest::Reporters.use! [
                             MiniTest::Reporters::JUnitReporter.new(ci_reports_folder + ENV['TEST_ENV_NUMBER'].to_s),
                             MiniTest::Reporters::DefaultReporter.new
                           ]
  # This will print out the names of the tests rather than '.' It is useful for handing a list of business logic to product
elsif ENV['SPEC_REPORTER']
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new()]
else
  Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
end