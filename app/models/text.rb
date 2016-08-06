class Text < ActiveRecord::Base
   has_many :posts, as: :postable, dependent: :destroy
   validates :body, presence: true
end
