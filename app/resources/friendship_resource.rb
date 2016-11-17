class FriendshipResource < JSONAPI::Resource
  has_one :friender, always_include_linkage_data: true
  has_one :friended, always_include_linkage_data: true
  attributes :strength
end
