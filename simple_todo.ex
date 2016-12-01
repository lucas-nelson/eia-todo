Code.load_file("list_map.ex", __DIR__)

defmodule SimpleTodo do
  def add_entry(simple_todo, entry) do
    simple_todo
    |> ListMap.add(entry.date, entry)
  end

  def entries(simple_todo, date) do
    simple_todo
    |> ListMap.get(date)
  end

  def new, do: ListMap.new
end
