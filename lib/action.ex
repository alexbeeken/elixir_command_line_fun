defmodule Action do
  def perform(state, action) do
    case action do
      "Actions" ->
        state
        |> Interface.menu("action")
      "Character" ->
        state
        |> State.show_status("character")
        |> Interface.message
        |> Interface.menu("main")
      "Main Menu" ->
        Interface.menu(state, "main")
    end
  end
end
