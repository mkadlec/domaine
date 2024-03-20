module Domain
  def self.valid_dkim(domain, selector)
    dig_command = "dig txt #{selector}._domainkey.#{domain}"
    valid_domain = false
    IO.popen(dig_command) do |stdout|
      output = stdout.read
      valid_domain = "output: #{output.include? 'ANSWER: 1'}" if output
    end
    valid_domain
  end
end