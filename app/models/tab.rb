# == Schema Information
#
# Table name: tabs
#
#  id      :bigint           not null, primary key
#  name    :string(255)
#  content :text(65535)
#  rank    :integer
#  link    :string(255)
#  sub_nav :boolean
#

class Tab < ApplicationRecord

  def main_tab?
    sub_nav == false
  end

  def sub_nav_main_tab?
    sub_nav == true
  end

end
