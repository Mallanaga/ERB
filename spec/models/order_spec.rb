# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  company_id   :integer
#  ordered_on   :date             default(Mon, 09 Dec 2013)
#  delivered_on :date             default(Mon, 16 Dec 2013)
#  paid         :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  invoice      :string(255)
#  tax          :decimal(, )
#

require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
end
