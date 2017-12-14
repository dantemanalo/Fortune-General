class PolicyInvoice < ApplicationRecord
  self.table_name = "gipi_invoice"
  self.primary_key = "prem_seq_no"

  alias_attribute :net_premium, :prem_amt
  alias_attribute :total_taxes, :tax_amt
  alias_attribute :duedate, :due_date

  belongs_to :policy, foreign_key: :policy_id
  has_many :policy_taxes, foreign_key: :prem_seq_no
  has_many :policy_payments, foreign_key: :prem_seq_no

  has_many :pdc_payments, foreign_key: :prem_seq_no
  has_many :pdc_payment_details, through: :pdc_payment, foreign_key: :prem_seq_no

  def gross_premium
    net_premium.to_s.to_d + total_taxes.to_s.to_d
  end

end
