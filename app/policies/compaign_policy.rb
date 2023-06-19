class CompaignPolicy < Struct.new(:user, :compaign)
  def new?
    user.type == "Expert"
  end
  def create?
    user.type == "Expert"
  end
  def edit?
    user.id == compaign.expert_id
  end
  def update?
    user.id == compaign.expert_id
  end
  def destroy?
    user.id == compaign.expert_id
  end
end
