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
#  volume     :decimal(, )
#  weight     :decimal(, )
#  trips      :integer          default(0)
#  distance   :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Box do
  pending "add some examples to (or delete) #{__FILE__}"
end
