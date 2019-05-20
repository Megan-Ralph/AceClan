class ForumEnrollment
  include HTTParty
  base_uri "https://forum.aceclan.org/api"

  def initialize(user_id)
    @user = User.find(user_id)
    @api_key = "c88540e61d46bb7837a677289c8872c1"
  end

  def enroll
    #I'm always sending validated as true because users get enrolled when they validate their account
    response = self.class.post("/core/members?key=#{@api_key}&name=#{@user.username}&email=#{@user.email}&password=#{@user.password}&group=3&validated=1")
    @user.update(enrolled: true)
  end

  def apply
    forum_user = self.class.get("/core/members?key=#{@api_key}&email=#{@user.email}")
    byebug
    self.class.post("/core/members?key=#{@api_key}?id=#{forum_user_id}")
    response = self.class.post("/core/members?key=#{@api_key}&email=#{@user.email}&group=31&secondaryGroups=68,#{@user.game.forum_game_id},40&validated=1")
    @user.update(applied: true)
  end

  def get_games_and_groups
    response = self.class.get("/core/members?key=#{@api_key}&email=#{@user.email}")
    data = JSON.parse(response.body)
    data = data.dig("results")

    @user.update(forum_primary_group_id: data.first.dig("primaryGroup").dig("id"), forum_primary_group_name: data.first.dig("primaryGroup").dig("formattedName"))

    secondary_groups = data.first.dig("secondaryGroups")
    secondary_groups.each do |s_group|
      if s_group.dig("formattedName").include?("Main Game")
        @user.update(forum_game_id: s_group.dig("id"))
      end
    end
    @user.update(forum_secondary_groups: secondary_groups.pluck("id"))
  end

end
