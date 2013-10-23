# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  box_id     :integer
#  month      :date
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  retired    :integer          default(0)
#

require 'spec_helper'

describe Trip do
  pending "add some examples to (or delete) #{__FILE__}"
end
