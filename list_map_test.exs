Code.load_file("simple_todo.ex", __DIR__)

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule ListMapTest do
  use ExUnit.Case

  test "creates an empty list map" do
    assert ListMap.new == %{}
  end

  test "adds an item to an empty list map" do
    actual =
      ListMap.new
      |> ListMap.add(:key, :value)

    assert actual == %{key: [:value]}
  end

  test "adds a second item on the same key" do
    actual =
      ListMap.new
      |> ListMap.add(:key, :value1)
      |> ListMap.add(:key, :value2)

    assert actual == %{key: [:value2, :value1]}
  end

  test "adds a new item on a distinct key" do
    actual =
      ListMap.new
      |> ListMap.add(:key1, :value1)
      |> ListMap.add(:key2, :value2)

    assert actual == %{key1: [:value1], key2: [:value2]}
  end

  test "gets an empty list for a non-existent key" do
    empty_list_map = ListMap.new

    assert ListMap.get(empty_list_map, :key) == []
  end

  test "gets existing items" do
    list_map =
      ListMap.new
      |> ListMap.add(:key1, :value1)
      |> ListMap.add(:key1, :value2)
      |> ListMap.add(:key2, :value3)

    actual = ListMap.get(list_map, :key1)

    assert actual == [:value2, :value1]
  end
end
