# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  likes      :integer          default("0")
#

class Story < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user ? controller.current_user : nil },
          title: proc {|controller, model| model.title }

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end
