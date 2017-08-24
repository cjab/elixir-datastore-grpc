defmodule DatastoreTest do
  use ExUnit.Case
  doctest Datastore
  alias Google_Datastore_V1.{
    Datastore.Stub, LookupRequest, PartitionId, CommitRequest,
    Mutation, Entity, Key, Key.PathElement, Entity.PropertiesEntry, Value}

  @project_id "loyal-glass-163002"
  @namespace_id ""

  test "it works" do
    {:ok, channel} = GRPC.Stub.connect("localhost:8080")

    partition = PartitionId.new(project_id: @project_id)
    path_element = PathElement.new(kind: "Event", name: "1")
    key = Key.new(path: [path_element], partition_id: partition)
    properties = %{"foo" => Value.new(string_value: "baz")}
    mutation = Mutation.new(insert: Entity.new(key: key, properties: properties))

    request = CommitRequest.new(
      project_id: @project_id,
      mode: 2,
      mutations: [mutation]
    )
    channel |> Stub.commit(request) |> IO.inspect()



    lookup_request = LookupRequest.new(
      project_id: @project_id,
      keys: [key]
    )

    channel |> Stub.lookup(lookup_request) |> IO.inspect()
  end
end
