require_relative './test_helper.rb'
require 'domaine.rb'
require 'ostruct'

describe ::Domaine do
  describe 'valid_dkim' do
    it 'returns true if the domain and selector are listed in the DNS records' do
      assert_equal(true, Domaine.valid_dkim('probenefitsadmin.ukg.com', 'ps1', io_class: DummyIo.new))
      assert_equal(false, Domaine.valid_dkim('hello.ukg.com', 'ps2', io_class: DummyIo.new))
    end
  end

  private

  class DummyIo
    def popen(command)
      yield OpenStruct.new(read: "blah blah ANSWER: 1 blah blah") if command.include?('ps1')
      yield OpenStruct.new(read: "blah blah ANSWER: 0 blah blah") unless command.include?('ps1')
    end
  end
end