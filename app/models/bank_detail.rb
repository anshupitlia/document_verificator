class BankDetail
  include Mongoid::Document
  store_in collection: 'bank_details'
  field :ifsc_code, type: String
  field :bank_name, type: String
  field :branch_code, type: String
end
