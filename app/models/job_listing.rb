# == Schema Information
#
# Table name: job_listings
#
#  id                :bigint           not null, primary key
#  name              :string(255)
#  description       :text(65535)
#  viewable_rank_ids :string(255)
#  created_by        :integer
#  active            :boolean
#

class JobListing < ApplicationRecord


end
