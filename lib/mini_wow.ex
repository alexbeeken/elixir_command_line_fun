defmodule MiniWow do
  def main(_args) do
    %{ name: Interface.ask_for_name }
    |> State.new
    |> Interface.menu("main")
  end
end
