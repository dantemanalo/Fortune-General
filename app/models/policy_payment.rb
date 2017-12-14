class PolicyPayment < ApplicationRecord
  self.table_name = "giac_aging_soa_details"
  self.primary_key = "prem_seq_no"

  alias_attribute :installment, :inst_no
  alias_attribute :total_payment, :total_payments
  alias_attribute :balance_due, :balance_amt_due

  belongs_to :policy_invoice, foreign_key: :prem_seq_no

end
