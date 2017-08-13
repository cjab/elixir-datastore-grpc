defmodule DatastoreTest do
  use ExUnit.Case
  doctest Datastore

  test "greets the world" do
    assert Datastore.hello() == :world
  end
end
