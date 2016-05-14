class Game

	attr_reader :tribes

	def initialize(*tribe)
		@tribes = []
		tribe.each { |tribe|
			@tribes << tribe
		}
	end

	def add_tribe(tribe)
		@tribes << tribe
	end

	def immunity_challenge
		@tribes.sample
	end

	def clear_tribes
		@tribes.clear
	end

	def merge(merge_tribe_name)
		merge_members = []
		@tribes.each { |tribe|
			tribe.members.each { |contestant|
				merge_members << contestant
			}
		}
		return Tribe.new(name: merge_tribe_name, members: merge_members)
	end

	def individual_immunity_challenge
		c_tribe = merge("combined_tribe")
		return c_tribe.members.sample
	end
end