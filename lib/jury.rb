class Jury

	attr_accessor :members, :finalists

	def initialize
		@members = []		
	end

	def add_member(member)
		@members << member	
	end

	def cast_votes(finalists)
		@finalists = Hash[finalists.map {|finalist| [finalist.name, 0]}]
		@members.each { |member|
			puts "#{member} voted: #{vote(finalists)}"
		}
		return @finalists
	end

	def vote(finalists)
		finalists.sample
	end
end