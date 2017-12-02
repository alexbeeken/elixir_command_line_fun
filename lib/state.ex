defmodule State do
  def new(options \\ %{ name: "noname" }) do
    case Character.new(options.name) do
      { :error, message } ->
        Interface.message [message]
        MiniWow.main([])
      { :ok, character } ->
        Interface.message ["Hello, #{character.name}."]
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
end
