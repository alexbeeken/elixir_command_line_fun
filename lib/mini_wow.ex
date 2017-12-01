defmodule MiniWow do
  def main(_args) do
    character =
      %{
        name: String.capitalize(Prompt.gets('name')),
        faction: Prompt.choice('faction', ['Horde', 'Alliance'])
      }
    IO.puts "Hello, #{character.name}. You have chosen to align with the #{character.faction}."
  end
end
