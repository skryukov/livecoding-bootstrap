# This is a mock of a Stripe API library.
# Do not modify this file, just assume it comes from a gem.
module Stripe
  class Error < StandardError; end

  def self.create_customer_with_card(email:, number:, cve:, exp_month:, exp_year:, name:)
    # calls Stripe API...

    # Bad card raises an error
    if number == "4000000000000002"
      raise Stripe::Error.new("Your card has been declined.")
    end

    {
      id: "card_#{SecureRandom.hex(8)}",
      exp_month:,
      exp_year:,
      last4: number[-4..],
      fingerprint: Digest::MD5.hexdigest("#{number}#{exp_month}#{exp_year}"),
      cvc_check: "pass",
      # other attributes...
      customer: {
        id: "cus_#{SecureRandom.hex(8)}",
        email:,
        # other attributes...
      },
    }
  end
end
