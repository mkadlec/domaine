module Domaine

  VALID_DKIM_KEY = 'ANSWER: 1'.freeze
  VALID_SPF_KEY = 'v=spf1'.freeze

  ##################################################################
  # This method is used to validate the domain and selector and return
  # true if the domain and selector are listed in the DNS records.
  ##################################################################
  def self.valid_dkim(domain, selector, io_class: IO)
    dig_command = "dig txt #{selector}._domainkey.#{domain}"
    valid_domain = false

    io_class.popen(dig_command) do |stdout|
      output = stdout.read
      valid_domain = output.include?(VALID_DKIM_KEY) if output
    end

    valid_domain
  end

  ##################################################################
  # This method is used to validate the domain and return true if the
  # domain has a valid SPF record.
  ##################################################################
  def self.valid_spf(domain, io_class: IO)
    dig_command = "dig txt #{domain}"
    valid_domain = false

    io_class.popen(dig_command) do |stdout|
      output = stdout.read
      valid_domain = output.include?(VALID_SPF_KEY) if output
    end

    valid_domain
  end
end