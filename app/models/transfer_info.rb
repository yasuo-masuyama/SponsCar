class TransferInfo < ApplicationRecord
  belongs_to :driver

  enum account_type:{ ordinary: 0, checking: 1 }

  def full_info
		bank_name + "銀行 " + branch_name + "支店 " + account_type_i18n + account_number.to_s + account_name
	end
end
