# == Schema Information
#
# Table name: sub_tabs
#
#  id     :bigint           not null, primary key
#  tab_id :integer
#  rank   :integer
#  link   :string(255)
#  name   :string(255)
#

class SubTab < ApplicationRecord

end
