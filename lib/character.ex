defmodule Character do
  def new(name) do
    if valid_name?(name) do
      { :ok, %{
        name: String.capitalize(name),
        experience: 0,
        level: 1
      } }
    else
      { :error, "Name should be between 3 - 12 characters and only contain letters."}
    end
  end

  def update_experience(character, gained) do
    xp = character.experience + gained
    character = %{ character | experience: xp }
    IO.puts "You gained #{gained}"
    if level_up?(character), do: level_up(character), else: character
  end

  def level_up?(character) do
    character.level + 1 <= Experience.level_for_experience(character.experience)
  end

  def level_up(character) do
    new_level = Experience.level_for_experience(character.experience)
    IO.puts "Congratulations! You have reached level #{new_level}!"
    %{ character | level: new_level }
  end

  def show_status(character) do
    IO.puts "-----------------------"
    IO.puts "Name: #{character.name}"
    IO.puts "Experience: #{character.experience}/#{Experience.experience_for_level(character.level + 1)}"
    IO.puts "Level: #{character.level}"
    IO.puts "-----------------------"
  end

  def valid_name?(name) do
    len = String.length(name)
    Regex.match?(~r/^[a-zA-Z]+$/, name)
      && 2 < len && len < 13
  end
end
