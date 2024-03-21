require_relative './test_helper.rb'
require 'domaine.rb'
require 'ostruct'

describe ::Domaine do
  describe 'valid_dkim' do
    it 'returns true if the domain and selector are listed in the DNS records' do
      assert_equal(true, Domaine.valid_dkim('hello-works.com', 'ps1', io_class: DummyIo.new))
      assert_equal(false, Domaine.valid_dkim('hello.com', 'ps2', io_class: DummyIo.new))
    end
  end

  describe 'valid_spf' do
    it 'returns true if the domain has a valid SPF record' do
      assert_equal(true, Domaine.valid_spf('ps1.com', io_class: DummyIo.new))
      assert_equal(false, Domaine.valid_spf('hello.com', io_class: DummyIo.new))
    end
  end

  private

  class DummyIo
    def popen(command)
      yield OpenStruct.new(read: "blah blah ANSWER: 1 blah v=spf1 blah") if command.include?('ps1')
      yield OpenStruct.new(read: "blah blah ANSWER: 0 blah blah") unless command.include?('ps1')
    end
  end
end