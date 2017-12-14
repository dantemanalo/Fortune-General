class Bank < ApplicationRecord
  self.table_name = "giac_banks"
  self.primary_key = "bank_cd"

  alias_attribute :short_name, :bank_sname
  alias_attribute :name, :bank_name

  belongs_to :pdc_payment_detail, foreign_key: :bank_cd, primary_key: :bank_cd
end
