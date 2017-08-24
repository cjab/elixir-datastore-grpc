defmodule Google_Type.LatLng do
  use Protobuf

  @type t :: %__MODULE__{
    latitude:  float,
    longitude: float
  }
  defstruct [:latitude, :longitude]

  field :latitude, 1, optional: true, type: :double
  field :longitude, 2, optional: true, type: :double
end
