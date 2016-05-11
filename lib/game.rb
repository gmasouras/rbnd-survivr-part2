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
		@tribes = Array.new
	end

	def merge(merged_tribe_name)
		merged_members = []
		@tribes.each { |tribe|
			tribe.members.each { |contestant|
				merged_members << contestant
			}
		}
		return Tribe.new(name: merged_tribe_name, members: merged_members)
	end
end