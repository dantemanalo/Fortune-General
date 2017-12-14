class PdcPayment < ApplicationRecord
  self.table_name = "giac_pdc_prem_colln"
  self.primary_key = "prem_seq_no"

  alias_attribute :amount, :collection_amt

  belongs_to :policy_invoice, foreign_key: :prem_seq_no
  has_one :pdc_payment_detail, foreign_key: :pdc_id, primary_key: :pdc_id

  has_one :apdc_payment, through: :pdc_payment_detail, foreign_key: :apdc_id
  has_one :bank, through: :pdc_payment_detail, foreign_key: :bank_cd, primary_key: :bank_cd
end
