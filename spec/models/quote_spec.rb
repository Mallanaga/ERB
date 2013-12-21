# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  company    :string(255)
#  email      :string(255)
#  phone      :string(255)
#  message    :text
#  type_box   :string(255)
#  length     :decimal(, )
#  width      :decimal(, )
#  height     :decimal(, )
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Quote do
  pending "add some examples to (or delete) #{__FILE__}"
end
