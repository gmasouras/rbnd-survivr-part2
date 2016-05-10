require_relative "../lib/contestant"
require_relative "../lib/jury"

@jury_members = %w(carlos walter aparna trinh diego juliana poornima)
@jury_members.map!{ |member| Contestant.new(member) }
@finalists = %w(orit colt)
@finalists.map!{ |member| Contestant.new(member) }
@jury = Jury.new


@jury.members = @jury_members
@jury.cast_votes(@finalists)

