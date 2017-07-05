class Message < ApplicationRecord
	validates :content, :username, presence: true
end
