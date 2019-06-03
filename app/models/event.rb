# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  name        :string(255)
#  description :text(65535)
#  game_id     :integer
#  date_time   :datetime
#

class Event < ApplicationRecord

end
