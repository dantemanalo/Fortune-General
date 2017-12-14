class Assured < ApplicationRecord
  self.table_name = "giis_assured"
  self.primary_key = "assd_no"

  alias_attribute :id, :assd_no
  alias_attribute :name, :assd_name

  has_many :policies, foreign_key: :assd_no

  def to_s
    name
  end
end
