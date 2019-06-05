# == Schema Information
#
# Table name: job_applications
#
#  id          :bigint           not null, primary key
#  user_id     :integer
#  listing_id  :integer
#  description :text(65535)
#  status      :integer
#

class JobApplication < ApplicationRecord
  enum status: [:pending, :accepted, :denied]

end
