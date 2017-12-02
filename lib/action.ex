defmodule Action do
  def perform(state, action) do
    case action do
      "Actions" ->
        state
        |> Interface.menu("action")
      "Character" ->
        state
        |> State.show_status("character")
        |> Interface.menu("main")
      "Main Menu" ->
        Interface.menu(state, "main")
      "Battle Menu" ->
        Interface.menu(state, "battle")
    end
  end
end
