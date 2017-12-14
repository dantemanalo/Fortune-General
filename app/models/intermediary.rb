class Intermediary < ApplicationRecord
  self.table_name = "giis_intermediary"
  self.primary_key = "intm_no"

  alias_attribute :name, :intm_name
  alias_attribute :type, :intm_type

  has_many :commission_invoices, foreign_key: :intrmdry_intm_no
  has_many :policies, through: :commission_invoices, foreign_key: :policy_id

  def credit_term
    if type == "BR"
      90
    else
      30
    end
    #
    # case type
    # when "BR" then 90
    # when "OA" then 60
    # when "SP" then 30
    # else 30
    # end
  end

end
