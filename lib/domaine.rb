module Domain

  VALID_DKIM_KEY = 'ANSWER: 1'.freeze

  ##################################################################
  # This method is used to validate the domain and selector and return
  # true if the domain and selector are listed in the DNS records.
  ##################################################################
  def self.valid_dkim(domain, selector)
    dig_command = "dig txt #{selector}._domainkey.#{domain}"
    valid_domain = false

    IO.popen(dig_command) do |stdout|
      output = stdout.read
      valid_domain = output.include?(VALID_DKIM_KEY) if output
    end

    valid_domain
  end
end