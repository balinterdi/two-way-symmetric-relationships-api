class PersonResource < JSONAPI::Resource
  attributes :name
  relationship :friender, to: :many, class_name: "Person"
  relationship :friended_by, to: :many, class_name: "Person"
end
