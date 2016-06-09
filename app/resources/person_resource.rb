class PersonResource < JSONAPI::Resource
  attributes :name
  relationship :friender, to: :many, class_name: "Person"
  relationship :friended_by, to: :many, class_name: "Person"
  relationship :friender_friendships, to: :many, class_name: "Friendship"
  relationship :friended_friendships, to: :many, class_name: "Friendship"
  relationship :friendships, to: :many, class_name: "Friendship"

  ## TODO: when there is an `includes` parameter, it will eventually
  # get to JSONAPI::Resource#apply_includes and call the `includes` method
  # on the `records`, which is the Person class. That will fail as it really
  # needs a relationship to be defined on the model
  # So my current idea is to use a custom `friendships` link instead and return
  # the correct, merged data there
  # def friendships(options={})
  #   puts "XXX PersonResource#frienships"
  #   Friendship.where("friender_id = ? OR friended_id = ?", id, id)
  # end

  def custom_links(options)
    { friendships: options[:serializer].link_builder.self_link(self) + "/friendships" }
  end
end

