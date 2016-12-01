Code.load_file("simple_todo.ex", __DIR__)

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule SimpleTodoTest do
  use ExUnit.Case

  test "creates an empty todo" do
    actual =
      SimpleTodo.new
      |> SimpleTodo.entries(:key)

    assert actual == []
  end

  test "holds a single entry" do
    actual =
      SimpleTodo.new
      |> SimpleTodo.add_entry(%{date: {2016, 11, 30}, title: "Dentist"})
      |> SimpleTodo.entries({2016, 11, 30})

    assert actual == [
      %{date: {2016, 11, 30}, title: "Dentist"},
    ]
  end

  test "holds multiple entries on multiple dates" do
    actual =
      SimpleTodo.new
      |> SimpleTodo.add_entry(%{date: {2016, 11, 30}, title: "Dentist"})
      |> SimpleTodo.add_entry(%{date: {2016, 11, 30}, title: "Shopping"})
      |> SimpleTodo.add_entry(%{date: {2016, 12, 1}, title: "Movies"})
      |> SimpleTodo.entries({2016, 11, 30})

    assert actual == [
      %{date: {2016, 11, 30}, title: "Shopping"},
      %{date: {2016, 11, 30}, title: "Dentist"},
    ]
  end
end
