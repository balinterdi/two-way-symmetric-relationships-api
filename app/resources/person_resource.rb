class PersonResource < JSONAPI::Resource
  attributes :name
  relationship :friender, to: :many, class_name: "Person"
  relationship :friended_by, to: :many, class_name: "Person"
  relationship :friender_friendships, to: :many, class_name: "Friendship"
  relationship :friended_friendships, to: :many, class_name: "Friendship"
  relationship :friendships, to: :many, class_name: "Friendship"

end

