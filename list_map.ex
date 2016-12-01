defmodule ListMap do
  @moduledoc """
    Higher level Map abstraction that specialises the Map values into a List
  """

  def add(map, key, value) do
    map
    |> Map.update(key, [value], &[value | &1])
  end

  def get(map, key) do
    map[key] || []
  end

  def new, do: %{}
end
