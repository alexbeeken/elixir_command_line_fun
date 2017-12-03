defmodule State do
  def new(options \\ %{ name: "noname" }) do
    case Character.new(options.name) do
      { :error, message } ->
        Interface.message message
        MiniWow.main([])
      { :ok, character } ->
        Interface.message "Hello, #{character.name}."
        %{ character: character }
    end
  end

  def show_status(state, thing) do
    case thing do
      "character" ->
        state.character
        |> Character.status
        |> Interface.message
      state
    end
  end

  def fight_enemy(state, enemy) do
    Interface.message "You killed #{enemy.name}."
    character = Character.update_experience(state.character, enemy.exp)
    update_character(state, character)
  end

  def update_character(state, character) do
    %{ state | character: character }
  end
end
