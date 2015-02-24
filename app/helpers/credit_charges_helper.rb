module CreditChargesHelper

	def row charge
		td = "<td> #{charge.customer.name rescue ''} </td>"
		td += "<td> #{charge.currency.upcase rescue 'IDR'} #{charge.amount} </td>"
		td += "<td> #{Time.at(charge.created).to_date.strftime '%d %B %Y'} </td>"			
	end

end
