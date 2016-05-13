class Jury

	attr_accessor :members

	def initialize
		@members = []		
	end

	def add_member(member)
		@members << member	
	end

	def cast_votes(finalists)
		finalists_hash = Hash[finalists.map {|finalist| [finalist.name, 0]}]
		@members.each { |member|
			prefered_finalist = vote(finalists)
			finalists_hash[prefered_finalist.name] += 1
			puts "#{member}".pink+" voted: "+"#{prefered_finalist}".upcase.blue
		}
		return finalists_hash
	end

	def vote(finalists)
		finalists.sample
	end

	def report_votes(final_votes)
		final_votes.each { |key, value|
			puts "Finalist "+"#{key}".upcase.blue+" got #{value} votes"
		}
	end

	def announce_winner(final_votes)
		winner = final_votes.max_by { |key, value| value}
		return winner[0]
	end

	def print_jury
		puts "Jury members: "
		members.each_with_index {|member, index|
			puts "#{index+1}. " + "#{member}".pink
		}
	end
end