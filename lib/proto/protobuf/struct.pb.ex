defmodule Google_Protobuf.Struct do
  use Protobuf

  @type t :: %__MODULE__{
    fields: %{String.t => Google_Protobuf.Value.t}
  }
  defstruct [:fields]

  field :fields, 1, repeated: true, type: Google_Protobuf.Struct.FieldsEntry, map: true
end

defmodule Google_Protobuf.Struct.FieldsEntry do
  use Protobuf, map: true

  @type t :: %__MODULE__{
    key:   String.t,
    value: Google_Protobuf.Value.t
  }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: Google_Protobuf.Value
end

defmodule Google_Protobuf.Value do
  use Protobuf

  @type t :: %__MODULE__{
    null_value:   integer,
    number_value: float,
    string_value: String.t,
    bool_value:   boolean,
    struct_value: Google_Protobuf.Struct.t,
    list_value:   Google_Protobuf.ListValue.t
  }
  defstruct [:null_value, :number_value, :string_value, :bool_value, :struct_value, :list_value]

  field :null_value, 1, optional: true, type: Google_Protobuf.NullValue, enum: true
  field :number_value, 2, optional: true, type: :double
  field :string_value, 3, optional: true, type: :string
  field :bool_value, 4, optional: true, type: :bool
  field :struct_value, 5, optional: true, type: Google_Protobuf.Struct
  field :list_value, 6, optional: true, type: Google_Protobuf.ListValue
end

defmodule Google_Protobuf.ListValue do
  use Protobuf

  @type t :: %__MODULE__{
    values: [Google_Protobuf.Value.t]
  }
  defstruct [:values]

  field :values, 1, repeated: true, type: Google_Protobuf.Value
end

defmodule Google_Protobuf.NullValue do
  use Protobuf, enum: true

  field :NULL_VALUE, 0
end
