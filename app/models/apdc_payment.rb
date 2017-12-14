class ApdcPayment < ApplicationRecord
  self.table_name = "giac_apdc_payt"
  self.primary_key = "apdc_id"

  alias_attribute :apdc_number, :apdc_no
  alias_attribute :source, :branch_cd
  alias_attribute :prefix, :apdc_pref
  alias_attribute :date, :apdc_date

  belongs_to :pdc_payment_detail, foreign_key: :apdc_id, primary_key: :apdc_id

end
