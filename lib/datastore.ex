defmodule Datastore do
  use GenServer

  @moduledoc """
  Documentation for Datastore.
  """

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts)
  end

  def init(opts) do
    host = Keyword.get(opts, :host, "localhost:8081")
    GRPC.Stub.connect(host)
  end
end
