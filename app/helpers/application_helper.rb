module ApplicationHelper
	def roles
		{
			'Manager' => 'manager',
			'Editor' => 'editor',
			'Viewer' => 'viewer'
		}
	end
	

	def title(*parts)
		unless parts.empty?
			content_for :title do
				(parts << "Ticketee").join(" - ")
			end
		end
	end

	def admins_only(&block)
		block.call if current_user.try(:admin?)
	end


end
