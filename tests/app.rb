require_relative "../lib/contestant"
require_relative "../lib/jury"

@jury_members = %w(carlos walter aparna trinh diego juliana poornima)
@jury_members.map!{ |member| Contestant.new(member) }
@finalists = %w(orit colt)
@finalists.map!{ |member| Contestant.new(member) }
@jury = Jury.new


@jury.members = @jury_members
@jury.cast_votes(@finalists)
@jury.report_votes(@jury.cast_votes(@finalists))

final_votes = {@finalists.first => 4, @finalists.last => 3}
@jury.announce_winner(final_votes)
puts @finalists.first.class

