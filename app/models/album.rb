class Album < ApplicationRecord
	GROUPS = {
		"Public" => "0",
		"Private" => "1",
	}
	belongs_to :user
	enum privacy: {
	    public_view: 0,
	    private_view: 1,
  	}
  	has_many :pictures, dependent: :destroy
  	scope 
end
