class FriendshipsController < JSONAPI::ResourceController
  def get_related_resources
    person = Person.find(params[:person_id])
    friendship_resources = person.friendships.map do |friendship|
      FriendshipResource.new(friendship, context)
    end
    resource_serializer = JSONAPI::ResourceSerializer.new(FriendshipResource)
    render json: resource_serializer.serialize_to_hash(friendship_resources)
  end
end
