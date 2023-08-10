module DriversHelper
  def check_apply_room
		@driver.under_deals.where.not(work_status: 'finished').where.not(work_status: 'checked_refuse')
	end
end
