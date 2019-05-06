class ForumEnrollment
  include HTTParty
  base_uri "https://forum.aceclan.org/api"

  def initialize(user_id)
    @user = User.find(user_id)
    @auth_body = { "key" => "c88540e61d46bb7837a677289c8872c1" }
    @options = {
      headers: { "Content-Type" => "application/json" }
    }
  end

  def enroll
    @body = @auth_body
    @body = {}
    @body["name"] = "#{@user.username}"
    @body["email"] = "#{@user.email}"
    @body["password"] = "#{@user.password}"
    @body["group"] = "67"
    @body["secondaryGroups"] = "68"
    @body["validated"] = "0"

    @options[:body] = @body.to_json
    response = self.class.post("/core/members?key=c88540e61d46bb7837a677289c8872c1&name=#{@user.username}&email=#{@user.email}&password=#{@user.password}&group=67&secondaryGroups=68&validated=0")
    #api acceptance format
    #http://www.example.com/api/core/hello?key={apiKeyHere}

  end
end
