class Policy < ApplicationRecord
  self.table_name = "gipi_polbasic"
  self.primary_key = "policy_id"

  alias_attribute :id, :policy_id
  alias_attribute :inception, :incept_date
  alias_attribute :expiry, :expiry_date
  alias_attribute :effectivity, :eff_date
  alias_attribute :issued, :issue_date
  alias_attribute :source, :iss_cd
  alias_attribute :sequence_no, :pol_seq_no

  belongs_to :assured, foreign_key: :assd_no

  has_one :commission_invoice, foreign_key: :policy_id
  has_one :intermediary, through: :commission_invoice, foreign_key: :intm_no

  has_one :policy_invoice, foreign_key: :policy_id
  has_many :policy_taxes, through: :policy_invoice, foreign_key: :prem_seq_no

  has_many :policy_payments, through: :policy_invoice, foreign_key: :prem_seq_no
  has_many :pdc_payments, through: :policy_invoice, foreign_key: :prem_seq_no

  def no
      "#{line_cd}-#{subline_cd}-#{source}-#{issue_yy}-#{proper_seq_no}-#{proper_renew_number}"
  end

  def endorsement_no
    "#{endt_iss_cd}-#{endt_yy}-#{endorsement_sequence}" if endt_seq_no?
  end

  def proper_seq_no
    sprintf '%07d', sequence_no
  end

	def proper_renew_number
    sprintf '%02d', renew_no
	end

  def endorsement_sequence
    sprintf '%07d', endt_seq_no
  end

  def net_due
    policy_invoice.gross_premium - commission_invoice.net_commission if policy_invoice && commission_invoice
  end

  def due_date
    effectivity + intermediary.credit_term if commission_invoice
  end
end
