class ForumEnrollment
  include HTTParty
  base_uri "https://forum.aceclan.org/api"

  def initialize(user_id)
    @user = User.find(user_id)
    @api_key = "9ccf76aa90a4049039a59890c7f43ba9"
  end

  def change_groups(forum_primary_group_id, forum_secondary_groups)
    forum_user = self.class.get("/core/members?key=#{@api_key}&email=#{@user.email}")
    forum_user_id = forum_user.dig("results").first.dig("id")

    response = self.class.post("/core/members/#{forum_user_id}/?key=#{@api_key}&group=#{forum_primary_group_id}&secondaryGroups=#{forum_secondary_groups}")

  end

  def enroll
    response = self.class.post("/core/members?key=#{@api_key}&name=#{@user.username}&email=#{@user.email}&password=#{@user.password}&group=3&validated=0")
    @user.update(enrolled: true, forum_primary_group_id: 3)
  end

  def apply
    forum_user = self.class.get("/core/members?key=#{@api_key}&email=#{@user.email}")
    forum_user_id = forum_user.dig("results").first.dig("id")
    response = self.class.post("/core/members/#{forum_user_id}/?key=#{@api_key}&group=31&secondaryGroups=32,#{Game.find(@user.game_id).forum_game_id},40")

    @user.update(applied: true, forum_primary_group_id: 31)
  end

  def get_forum_groups
    GroupDump.all.delete_all

    response = self.class.get("/core/groups?key=#{@api_key}")
    data = JSON.parse(response.body)
    data = data.dig("results")

    data.each do |set|
      GroupDump.where(forum_group_id: set.dig("id"), name: set.dig("name")).first_or_create
    end

    response = self.class.get("/core/groups?key=#{@api_key}&page=2")
    data = JSON.parse(response.body)
    data = data.dig("results")

    data.each do |set|
      GroupDump.where(forum_group_id: set.dig("id"), name: set.dig("name")).first_or_create
    end

    response = self.class.get("/core/groups?key=#{@api_key}&page=3")
    data = JSON.parse(response.body)
    data = data.dig("results")

    data.each do |set|
      GroupDump.where(forum_group_id: set.dig("id"), name: set.dig("name")).first_or_create
    end
  end

  def get_games_and_groups
    response = self.class.get("/core/members?key=#{@api_key}&email=#{@user.email}")
    data = JSON.parse(response.body)
    data = data.dig("results")

    forum_primary_group = data.first.dig("primaryGroup").dig("id")
    forum_group_name = data.first.dig("primaryGroup").dig("formattedName")

    @user.forum_primary_group_id = forum_primary_group
    @user.forum_primary_group_name = forum_group_name

    secondary_groups = data.first.dig("secondaryGroups")
    secondary_groups.each do |s_group|
      if s_group.dig("formattedName").include?("Main Game")
        @user.forum_game_id = s_group.dig("id")
      end
    end
    @user.forum_secondary_groups = secondary_groups.pluck("id")

    @user.save
  end

end
