# == Schema Information
#
# Table name: boxes
#
#  id         :integer          not null, primary key
#  company_id :integer
#  uid        :string(255)
#  length     :decimal(, )
#  width      :decimal(, )
#  height     :decimal(, )
#  weight     :decimal(, )
#  cost       :decimal(6, 2)
#  cb_cost    :decimal(6, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  frequency  :integer
#  active     :boolean
#

require 'spec_helper'

describe Box do
  pending "add some examples to (or delete) #{__FILE__}"
end
