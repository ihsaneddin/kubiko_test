module ApplicationHelper

	def table records, options={}
		table = "<table id='#{options[:type] || 'successful'}'>"
		table += th records
		table += tbody records, options[:type] || 'successful'
		table += '</table>'
		table.html_safe
	end

	def th records, thead = ''
		columns = columns records	
		columns.each_with_index do |th,i,zero=0|
			thead = "<thead><tr>" if i.eql? zero
			thead += "<th>#{th}</th>"
			thead += "</tr></thead>" if (i+1).eql? columns.length 
		end
		thead
	end

	def tbody records, type, tbody='', tds=''
		tbody = "<tr><td colspan = '#{columns(records).length}'>No Data</td></tr>"
		records.each_with_index do |record,i,zero=0|
			tds.send "#{i.eql?(zero) ? 'replace' : 'concat'}", "<tr class = #{type.downcase}>"
			tds += row(record)
			tds += "</tr>"
		end
		"<tbody>#{tds}</tbody>"
	end

	def columns records
		eval "#{records.klass.name}::THEAD"	rescue []
	end

end
