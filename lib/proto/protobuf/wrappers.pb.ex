defmodule Google_Protobuf.DoubleValue do
  use Protobuf

  @type t :: %__MODULE__{
    value: float
  }
  defstruct [:value]

  field :value, 1, optional: true, type: :double
end

defmodule Google_Protobuf.FloatValue do
  use Protobuf

  @type t :: %__MODULE__{
    value: float
  }
  defstruct [:value]

  field :value, 1, optional: true, type: :float
end

defmodule Google_Protobuf.Int64Value do
  use Protobuf

  @type t :: %__MODULE__{
    value: integer
  }
  defstruct [:value]

  field :value, 1, optional: true, type: :int64
end

defmodule Google_Protobuf.UInt64Value do
  use Protobuf

  @type t :: %__MODULE__{
    value: non_neg_integer
  }
  defstruct [:value]

  field :value, 1, optional: true, type: :uint64
end

defmodule Google_Protobuf.Int32Value do
  use Protobuf

  @type t :: %__MODULE__{
    value: integer
  }
  defstruct [:value]

  field :value, 1, optional: true, type: :int32
end

defmodule Google_Protobuf.UInt32Value do
  use Protobuf

  @type t :: %__MODULE__{
    value: non_neg_integer
  }
  defstruct [:value]

  field :value, 1, optional: true, type: :uint32
end

defmodule Google_Protobuf.BoolValue do
  use Protobuf

  @type t :: %__MODULE__{
    value: boolean
  }
  defstruct [:value]

  field :value, 1, optional: true, type: :bool
end

defmodule Google_Protobuf.StringValue do
  use Protobuf

  @type t :: %__MODULE__{
    value: String.t
  }
  defstruct [:value]

  field :value, 1, optional: true, type: :string
end

defmodule Google_Protobuf.BytesValue do
  use Protobuf

  @type t :: %__MODULE__{
    value: String.t
  }
  defstruct [:value]

  field :value, 1, optional: true, type: :bytes
end
