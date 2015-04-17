module EventsHelper

	def getTimeString(start_time, end_time)

	    if (start_time == "" && end_time == "")
	      return "No scheduled time."
	    end

	    if start_time == ""
	      return "No scheduled start time."
	    end

	    if end_time == ""
	      return start_time
	    end

	    if(start_time[0..9] == end_time[0..9])
	      return start_time + " - " +end_time[10..end_time.length]
	    else
	      return start_time + " - " + end_time
	    end

  	end

end
