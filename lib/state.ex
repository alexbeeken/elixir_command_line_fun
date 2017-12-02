defmodule State do
  def new(options \\ %{ name: "noname" }) do
    case Character.valid_name?(options.name) do
      false ->
        System.halt(0)
      true ->
        name = String.capitalize options.name 
        Interface.message "Hello, #{name}."
        %{
          character: %{
            name: name,
            level: 1,
            experience: 0
          }
        }
    end
  end

  def show_status(state, thing) do
    case thing do
      "Character" ->
        state.character
        |> Character.status
        |> Interface.message
    end
  end
end
