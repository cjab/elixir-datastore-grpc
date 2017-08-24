defmodule Google_Datastore_V1.PartitionId do
  use Protobuf

  @type t :: %__MODULE__{
    project_id:   String.t,
    namespace_id: String.t
  }
  defstruct [:project_id, :namespace_id]

  field :project_id, 2, optional: true, type: :string
  field :namespace_id, 4, optional: true, type: :string
end

defmodule Google_Datastore_V1.Key do
  use Protobuf

  @type t :: %__MODULE__{
    partition_id: Google_Datastore_V1.PartitionId.t,
    path:         [Google_Datastore_V1.Key.PathElement.t]
  }
  defstruct [:partition_id, :path]

  field :partition_id, 1, optional: true, type: Google_Datastore_V1.PartitionId
  field :path, 2, repeated: true, type: Google_Datastore_V1.Key.PathElement
end

defmodule Google_Datastore_V1.Key.PathElement do
  use Protobuf

  @type t :: %__MODULE__{
    kind: String.t,
    id:   integer,
    name: String.t
  }
  defstruct [:kind, :id, :name]

  field :kind, 1, optional: true, type: :string
  field :id, 2, optional: true, type: :int64
  field :name, 3, optional: true, type: :string
end

defmodule Google_Datastore_V1.ArrayValue do
  use Protobuf

  @type t :: %__MODULE__{
    values: [Google_Datastore_V1.Value.t]
  }
  defstruct [:values]

  field :values, 1, repeated: true, type: Google_Datastore_V1.Value
end

defmodule Google_Datastore_V1.Value do
  use Protobuf

  @type t :: %__MODULE__{
    null_value:           integer,
    boolean_value:        boolean,
    integer_value:        integer,
    double_value:         float,
    timestamp_value:      Google_Protobuf.Timestamp.t,
    key_value:            Google_Datastore_V1.Key.t,
    string_value:         String.t,
    blob_value:           String.t,
    geo_point_value:      Google_Type.LatLng.t,
    entity_value:         Google_Datastore_V1.Entity.t,
    array_value:          Google_Datastore_V1.ArrayValue.t,
    meaning:              integer,
    exclude_from_indexes: boolean
  }
  defstruct [:null_value, :boolean_value, :integer_value, :double_value, :timestamp_value, :key_value, :string_value, :blob_value, :geo_point_value, :entity_value, :array_value, :meaning, :exclude_from_indexes]

  field :null_value, 11, optional: true, type: Google_Protobuf.NullValue, enum: true
  field :boolean_value, 1, optional: true, type: :bool
  field :integer_value, 2, optional: true, type: :int64
  field :double_value, 3, optional: true, type: :double
  field :timestamp_value, 10, optional: true, type: Google_Protobuf.Timestamp
  field :key_value, 5, optional: true, type: Google_Datastore_V1.Key
  field :string_value, 17, optional: true, type: :string
  field :blob_value, 18, optional: true, type: :bytes
  field :geo_point_value, 8, optional: true, type: Google_Type.LatLng
  field :entity_value, 6, optional: true, type: Google_Datastore_V1.Entity
  field :array_value, 9, optional: true, type: Google_Datastore_V1.ArrayValue
  field :meaning, 14, optional: true, type: :int32
  field :exclude_from_indexes, 19, optional: true, type: :bool
end

defmodule Google_Datastore_V1.Entity do
  use Protobuf

  @type t :: %__MODULE__{
    key:        Google_Datastore_V1.Key.t,
    properties: %{String.t => Google_Datastore_V1.Value.t}
  }
  defstruct [:key, :properties]

  field :key, 1, optional: true, type: Google_Datastore_V1.Key
  field :properties, 3, repeated: true, type: Google_Datastore_V1.Entity.PropertiesEntry, map: true
end

defmodule Google_Datastore_V1.Entity.PropertiesEntry do
  use Protobuf, map: true

  @type t :: %__MODULE__{
    key:   String.t,
    value: Google_Datastore_V1.Value.t
  }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: Google_Datastore_V1.Value
end
