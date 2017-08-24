defmodule Google_Datastore_V1.EntityResult do
  use Protobuf

  @type t :: %__MODULE__{
    entity:  Google_Datastore_V1.Entity.t,
    version: integer,
    cursor:  String.t
  }
  defstruct [:entity, :version, :cursor]

  field :entity, 1, optional: true, type: Google_Datastore_V1.Entity
  field :version, 4, optional: true, type: :int64
  field :cursor, 3, optional: true, type: :bytes
end

defmodule Google_Datastore_V1.EntityResult.ResultType do
  use Protobuf, enum: true

  field :RESULT_TYPE_UNSPECIFIED, 0
  field :FULL, 1
  field :PROJECTION, 2
  field :KEY_ONLY, 3
end

defmodule Google_Datastore_V1.Query do
  use Protobuf

  @type t :: %__MODULE__{
    projection:   [Google_Datastore_V1.Projection.t],
    kind:         [Google_Datastore_V1.KindExpression.t],
    filter:       Google_Datastore_V1.Filter.t,
    order:        [Google_Datastore_V1.PropertyOrder.t],
    distinct_on:  [Google_Datastore_V1.PropertyReference.t],
    start_cursor: String.t,
    end_cursor:   String.t,
    offset:       integer,
    limit:        Google_Protobuf.Int32Value.t
  }
  defstruct [:projection, :kind, :filter, :order, :distinct_on, :start_cursor, :end_cursor, :offset, :limit]

  field :projection, 2, repeated: true, type: Google_Datastore_V1.Projection
  field :kind, 3, repeated: true, type: Google_Datastore_V1.KindExpression
  field :filter, 4, optional: true, type: Google_Datastore_V1.Filter
  field :order, 5, repeated: true, type: Google_Datastore_V1.PropertyOrder
  field :distinct_on, 6, repeated: true, type: Google_Datastore_V1.PropertyReference
  field :start_cursor, 7, optional: true, type: :bytes
  field :end_cursor, 8, optional: true, type: :bytes
  field :offset, 10, optional: true, type: :int32
  field :limit, 12, optional: true, type: Google_Protobuf.Int32Value
end

defmodule Google_Datastore_V1.KindExpression do
  use Protobuf

  @type t :: %__MODULE__{
    name: String.t
  }
  defstruct [:name]

  field :name, 1, optional: true, type: :string
end

defmodule Google_Datastore_V1.PropertyReference do
  use Protobuf

  @type t :: %__MODULE__{
    name: String.t
  }
  defstruct [:name]

  field :name, 2, optional: true, type: :string
end

defmodule Google_Datastore_V1.Projection do
  use Protobuf

  @type t :: %__MODULE__{
    property: Google_Datastore_V1.PropertyReference.t
  }
  defstruct [:property]

  field :property, 1, optional: true, type: Google_Datastore_V1.PropertyReference
end

defmodule Google_Datastore_V1.PropertyOrder do
  use Protobuf

  @type t :: %__MODULE__{
    property:  Google_Datastore_V1.PropertyReference.t,
    direction: integer
  }
  defstruct [:property, :direction]

  field :property, 1, optional: true, type: Google_Datastore_V1.PropertyReference
  field :direction, 2, optional: true, type: Google_Datastore_V1.PropertyOrder.Direction, enum: true
end

defmodule Google_Datastore_V1.PropertyOrder.Direction do
  use Protobuf, enum: true

  field :DIRECTION_UNSPECIFIED, 0
  field :ASCENDING, 1
  field :DESCENDING, 2
end

defmodule Google_Datastore_V1.Filter do
  use Protobuf

  @type t :: %__MODULE__{
    composite_filter: Google_Datastore_V1.CompositeFilter.t,
    property_filter:  Google_Datastore_V1.PropertyFilter.t
  }
  defstruct [:composite_filter, :property_filter]

  field :composite_filter, 1, optional: true, type: Google_Datastore_V1.CompositeFilter
  field :property_filter, 2, optional: true, type: Google_Datastore_V1.PropertyFilter
end

defmodule Google_Datastore_V1.CompositeFilter do
  use Protobuf

  @type t :: %__MODULE__{
    op:      integer,
    filters: [Google_Datastore_V1.Filter.t]
  }
  defstruct [:op, :filters]

  field :op, 1, optional: true, type: Google_Datastore_V1.CompositeFilter.Operator, enum: true
  field :filters, 2, repeated: true, type: Google_Datastore_V1.Filter
end

defmodule Google_Datastore_V1.CompositeFilter.Operator do
  use Protobuf, enum: true

  field :OPERATOR_UNSPECIFIED, 0
  field :AND, 1
end

defmodule Google_Datastore_V1.PropertyFilter do
  use Protobuf

  @type t :: %__MODULE__{
    property: Google_Datastore_V1.PropertyReference.t,
    op:       integer,
    value:    Google_Datastore_V1.Value.t
  }
  defstruct [:property, :op, :value]

  field :property, 1, optional: true, type: Google_Datastore_V1.PropertyReference
  field :op, 2, optional: true, type: Google_Datastore_V1.PropertyFilter.Operator, enum: true
  field :value, 3, optional: true, type: Google_Datastore_V1.Value
end

defmodule Google_Datastore_V1.PropertyFilter.Operator do
  use Protobuf, enum: true

  field :OPERATOR_UNSPECIFIED, 0
  field :LESS_THAN, 1
  field :LESS_THAN_OR_EQUAL, 2
  field :GREATER_THAN, 3
  field :GREATER_THAN_OR_EQUAL, 4
  field :EQUAL, 5
  field :HAS_ANCESTOR, 11
end

defmodule Google_Datastore_V1.GqlQuery do
  use Protobuf

  @type t :: %__MODULE__{
    query_string:        String.t,
    allow_literals:      boolean,
    named_bindings:      %{String.t => Google_Datastore_V1.GqlQueryParameter.t},
    positional_bindings: [Google_Datastore_V1.GqlQueryParameter.t]
  }
  defstruct [:query_string, :allow_literals, :named_bindings, :positional_bindings]

  field :query_string, 1, optional: true, type: :string
  field :allow_literals, 2, optional: true, type: :bool
  field :named_bindings, 5, repeated: true, type: Google_Datastore_V1.GqlQuery.NamedBindingsEntry, map: true
  field :positional_bindings, 4, repeated: true, type: Google_Datastore_V1.GqlQueryParameter
end

defmodule Google_Datastore_V1.GqlQuery.NamedBindingsEntry do
  use Protobuf, map: true

  @type t :: %__MODULE__{
    key:   String.t,
    value: Google_Datastore_V1.GqlQueryParameter.t
  }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: Google_Datastore_V1.GqlQueryParameter
end

defmodule Google_Datastore_V1.GqlQueryParameter do
  use Protobuf

  @type t :: %__MODULE__{
    value:  Google_Datastore_V1.Value.t,
    cursor: String.t
  }
  defstruct [:value, :cursor]

  field :value, 2, optional: true, type: Google_Datastore_V1.Value
  field :cursor, 3, optional: true, type: :bytes
end

defmodule Google_Datastore_V1.QueryResultBatch do
  use Protobuf

  @type t :: %__MODULE__{
    skipped_results:    integer,
    skipped_cursor:     String.t,
    entity_result_type: integer,
    entity_results:     [Google_Datastore_V1.EntityResult.t],
    end_cursor:         String.t,
    more_results:       integer,
    snapshot_version:   integer
  }
  defstruct [:skipped_results, :skipped_cursor, :entity_result_type, :entity_results, :end_cursor, :more_results, :snapshot_version]

  field :skipped_results, 6, optional: true, type: :int32
  field :skipped_cursor, 3, optional: true, type: :bytes
  field :entity_result_type, 1, optional: true, type: Google_Datastore_V1.EntityResult.ResultType, enum: true
  field :entity_results, 2, repeated: true, type: Google_Datastore_V1.EntityResult
  field :end_cursor, 4, optional: true, type: :bytes
  field :more_results, 5, optional: true, type: Google_Datastore_V1.QueryResultBatch.MoreResultsType, enum: true
  field :snapshot_version, 7, optional: true, type: :int64
end

defmodule Google_Datastore_V1.QueryResultBatch.MoreResultsType do
  use Protobuf, enum: true

  field :MORE_RESULTS_TYPE_UNSPECIFIED, 0
  field :NOT_FINISHED, 1
  field :MORE_RESULTS_AFTER_LIMIT, 2
  field :MORE_RESULTS_AFTER_CURSOR, 4
  field :NO_MORE_RESULTS, 3
end
