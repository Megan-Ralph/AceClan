class ForumEnrollment
  include HTTParty
  base_uri "https://forum.aceclan.org/api"

  def initialize(user_id)
    @user = User.find(user_id)
    @api_key = "c88540e61d46bb7837a677289c8872c1"
  end

  def enroll
    #I'm always sending validated as true because users get enrolled when they validate their account
    response = self.class.post("/core/members?key=#{@api_key}&name=#{@user.username}&email=#{@user.email}&password=#{@user.password}&group=67&secondaryGroups=68&validated=1")
    @user.update(enrolled: true)
  end

  def apply
    response = self.class.post("/core/members?key=#{@api_key}&name=#{@user.username}&email=#{@user.email}&password=#{@user.password}&group=67&secondaryGroups=68&validated=1")

    @user.update(applied: true)
  end
end
