defmodule Google_Datastore_V1.LookupRequest do
  use Protobuf

  @type t :: %__MODULE__{
    project_id:   String.t,
    read_options: Google_Datastore_V1.ReadOptions.t,
    keys:         [Google_Datastore_V1.Key.t]
  }
  defstruct [:project_id, :read_options, :keys]

  field :project_id, 8, optional: true, type: :string
  field :read_options, 1, optional: true, type: Google_Datastore_V1.ReadOptions
  field :keys, 3, repeated: true, type: Google_Datastore_V1.Key
end

defmodule Google_Datastore_V1.LookupResponse do
  use Protobuf

  @type t :: %__MODULE__{
    found:    [Google_Datastore_V1.EntityResult.t],
    missing:  [Google_Datastore_V1.EntityResult.t],
    deferred: [Google_Datastore_V1.Key.t]
  }
  defstruct [:found, :missing, :deferred]

  field :found, 1, repeated: true, type: Google_Datastore_V1.EntityResult
  field :missing, 2, repeated: true, type: Google_Datastore_V1.EntityResult
  field :deferred, 3, repeated: true, type: Google_Datastore_V1.Key
end

defmodule Google_Datastore_V1.RunQueryRequest do
  use Protobuf

  @type t :: %__MODULE__{
    project_id:   String.t,
    partition_id: Google_Datastore_V1.PartitionId.t,
    read_options: Google_Datastore_V1.ReadOptions.t,
    query:        Google_Datastore_V1.Query.t,
    gql_query:    Google_Datastore_V1.GqlQuery.t
  }
  defstruct [:project_id, :partition_id, :read_options, :query, :gql_query]

  field :project_id, 8, optional: true, type: :string
  field :partition_id, 2, optional: true, type: Google_Datastore_V1.PartitionId
  field :read_options, 1, optional: true, type: Google_Datastore_V1.ReadOptions
  field :query, 3, optional: true, type: Google_Datastore_V1.Query
  field :gql_query, 7, optional: true, type: Google_Datastore_V1.GqlQuery
end

defmodule Google_Datastore_V1.RunQueryResponse do
  use Protobuf

  @type t :: %__MODULE__{
    batch: Google_Datastore_V1.QueryResultBatch.t,
    query: Google_Datastore_V1.Query.t
  }
  defstruct [:batch, :query]

  field :batch, 1, optional: true, type: Google_Datastore_V1.QueryResultBatch
  field :query, 2, optional: true, type: Google_Datastore_V1.Query
end

defmodule Google_Datastore_V1.BeginTransactionRequest do
  use Protobuf

  @type t :: %__MODULE__{
    project_id:          String.t,
    transaction_options: Google_Datastore_V1.TransactionOptions.t
  }
  defstruct [:project_id, :transaction_options]

  field :project_id, 8, optional: true, type: :string
  field :transaction_options, 10, optional: true, type: Google_Datastore_V1.TransactionOptions
end

defmodule Google_Datastore_V1.BeginTransactionResponse do
  use Protobuf

  @type t :: %__MODULE__{
    transaction: String.t
  }
  defstruct [:transaction]

  field :transaction, 1, optional: true, type: :bytes
end

defmodule Google_Datastore_V1.RollbackRequest do
  use Protobuf

  @type t :: %__MODULE__{
    project_id:  String.t,
    transaction: String.t
  }
  defstruct [:project_id, :transaction]

  field :project_id, 8, optional: true, type: :string
  field :transaction, 1, optional: true, type: :bytes
end

defmodule Google_Datastore_V1.RollbackResponse do
  use Protobuf

  defstruct []

end

defmodule Google_Datastore_V1.CommitRequest do
  use Protobuf

  @type t :: %__MODULE__{
    project_id:  String.t,
    mode:        integer,
    transaction: String.t,
    mutations:   [Google_Datastore_V1.Mutation.t]
  }
  defstruct [:project_id, :mode, :transaction, :mutations]

  field :project_id, 8, optional: true, type: :string
  field :mode, 5, optional: true, type: Google_Datastore_V1.CommitRequest.Mode, enum: true
  field :transaction, 1, optional: true, type: :bytes
  field :mutations, 6, repeated: true, type: Google_Datastore_V1.Mutation
end

defmodule Google_Datastore_V1.CommitRequest.Mode do
  use Protobuf, enum: true

  field :MODE_UNSPECIFIED, 0
  field :TRANSACTIONAL, 1
  field :NON_TRANSACTIONAL, 2
end

defmodule Google_Datastore_V1.CommitResponse do
  use Protobuf

  @type t :: %__MODULE__{
    mutation_results: [Google_Datastore_V1.MutationResult.t],
    index_updates:    integer
  }
  defstruct [:mutation_results, :index_updates]

  field :mutation_results, 3, repeated: true, type: Google_Datastore_V1.MutationResult
  field :index_updates, 4, optional: true, type: :int32
end

defmodule Google_Datastore_V1.AllocateIdsRequest do
  use Protobuf

  @type t :: %__MODULE__{
    project_id: String.t,
    keys:       [Google_Datastore_V1.Key.t]
  }
  defstruct [:project_id, :keys]

  field :project_id, 8, optional: true, type: :string
  field :keys, 1, repeated: true, type: Google_Datastore_V1.Key
end

defmodule Google_Datastore_V1.AllocateIdsResponse do
  use Protobuf

  @type t :: %__MODULE__{
    keys: [Google_Datastore_V1.Key.t]
  }
  defstruct [:keys]

  field :keys, 1, repeated: true, type: Google_Datastore_V1.Key
end

defmodule Google_Datastore_V1.Mutation do
  use Protobuf

  @type t :: %__MODULE__{
    insert:       Google_Datastore_V1.Entity.t,
    update:       Google_Datastore_V1.Entity.t,
    upsert:       Google_Datastore_V1.Entity.t,
    delete:       Google_Datastore_V1.Key.t,
    base_version: integer
  }
  defstruct [:insert, :update, :upsert, :delete, :base_version]

  field :insert, 4, optional: true, type: Google_Datastore_V1.Entity
  field :update, 5, optional: true, type: Google_Datastore_V1.Entity
  field :upsert, 6, optional: true, type: Google_Datastore_V1.Entity
  field :delete, 7, optional: true, type: Google_Datastore_V1.Key
  field :base_version, 8, optional: true, type: :int64
end

defmodule Google_Datastore_V1.MutationResult do
  use Protobuf

  @type t :: %__MODULE__{
    key:               Google_Datastore_V1.Key.t,
    version:           integer,
    conflict_detected: boolean
  }
  defstruct [:key, :version, :conflict_detected]

  field :key, 3, optional: true, type: Google_Datastore_V1.Key
  field :version, 4, optional: true, type: :int64
  field :conflict_detected, 5, optional: true, type: :bool
end

defmodule Google_Datastore_V1.ReadOptions do
  use Protobuf

  @type t :: %__MODULE__{
    read_consistency: integer,
    transaction:      String.t
  }
  defstruct [:read_consistency, :transaction]

  field :read_consistency, 1, optional: true, type: Google_Datastore_V1.ReadOptions.ReadConsistency, enum: true
  field :transaction, 2, optional: true, type: :bytes
end

defmodule Google_Datastore_V1.ReadOptions.ReadConsistency do
  use Protobuf, enum: true

  field :READ_CONSISTENCY_UNSPECIFIED, 0
  field :STRONG, 1
  field :EVENTUAL, 2
end

defmodule Google_Datastore_V1.TransactionOptions do
  use Protobuf

  @type t :: %__MODULE__{
    read_write: Google_Datastore_V1.TransactionOptions.ReadWrite.t,
    read_only:  Google_Datastore_V1.TransactionOptions.ReadOnly.t
  }
  defstruct [:read_write, :read_only]

  field :read_write, 1, optional: true, type: Google_Datastore_V1.TransactionOptions.ReadWrite
  field :read_only, 2, optional: true, type: Google_Datastore_V1.TransactionOptions.ReadOnly
end

defmodule Google_Datastore_V1.TransactionOptions.ReadWrite do
  use Protobuf

  @type t :: %__MODULE__{
    previous_transaction: String.t
  }
  defstruct [:previous_transaction]

  field :previous_transaction, 1, optional: true, type: :bytes
end

defmodule Google_Datastore_V1.TransactionOptions.ReadOnly do
  use Protobuf

  defstruct []

end

defmodule Google_Datastore_V1.Datastore.Service do
  use GRPC.Service, name: "google.datastore.v1.Datastore"

  rpc :Lookup, Google_Datastore_V1.LookupRequest, Google_Datastore_V1.LookupResponse
  rpc :RunQuery, Google_Datastore_V1.RunQueryRequest, Google_Datastore_V1.RunQueryResponse
  rpc :BeginTransaction, Google_Datastore_V1.BeginTransactionRequest, Google_Datastore_V1.BeginTransactionResponse
  rpc :Commit, Google_Datastore_V1.CommitRequest, Google_Datastore_V1.CommitResponse
  rpc :Rollback, Google_Datastore_V1.RollbackRequest, Google_Datastore_V1.RollbackResponse
  rpc :AllocateIds, Google_Datastore_V1.AllocateIdsRequest, Google_Datastore_V1.AllocateIdsResponse
end

defmodule Google_Datastore_V1.Datastore.Stub do
  use GRPC.Stub, service: Google_Datastore_V1.Datastore.Service
end
