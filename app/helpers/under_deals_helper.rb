module UnderDealsHelper
	def check_apply
		current_driver.under_deals.where.not(work_status: 'finished').where.not(work_status: 'checked_refuse')
	end

	def full_info_with_newlines(transfer_info)
		"#{transfer_info.bank_name}\n#{transfer_info.account_number}"
	end
end
