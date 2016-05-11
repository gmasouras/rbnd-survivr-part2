class Tribe

	attr_reader :name, :members

	def initialize(tribe)
		@name = tribe[:name]
		@members = tribe[:members]
		puts tribe
	end

	def to_s
		@name
	end

	def tribal_council(contestant)
		@members.delete(contestant[:immune])
		return @members.sample
	end
end