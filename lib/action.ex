defmodule Action do
  def perform(state, action) do
    case action do
      "Actions" ->
        state
        |> Interface.action_menu
      "Character" ->
        state
        |> State.show_status("character")
        |> Interface.message
      "Main Menu" ->
        Interface.main_menu(state)
    end
  end
end
