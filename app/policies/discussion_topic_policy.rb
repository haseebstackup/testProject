class DiscussionTopicPolicy < Struct.new(:user, :discussion_topic)

  def new?
    user.type == "Novice" && user.status == "qualified"
  end
  def create?
   if user.type == "Novice" && user.status == "qualified"
      expert_compaigns = discussion_topic.compaign.expert.compaigns.where.not(id: discussion_topic.compaign.id)
      expert_compaigns.each do |c|
        d = c.discussion_topics
        d.each do |d|
          if d.novice_id == user.id
            return false
          else
            return true
          end
        end
      end
   else
      false
   end
  end
  def edit?
    user.id == discussion_topic.novice_id
  end
  def update?
    user.id == discussion_topic.novice_id
  end
  def destroy?
    user.id == discussion_topic.novice_id
  end
end
