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
    Console.message "You gained #{gained} xp."
    character = level_up_check(character)
    Console.message Experience.progress_bar(character.experience, character.level)
    character
  end

  def level_up_check(character) do
    if character.level < Experience.level_for_experience(character.experience) do
      new_level = Experience.level_for_experience(character.experience)
      IO.puts "Congratulations! You have reached level #{new_level}!"
      %{ character | level: new_level }
    else
      character
    end
  end

  def status(character) do
    [
      "-----------------------",
      "Name: #{character.name}",
      "Experience: #{character.experience}/#{Experience.experience_for_level(character.level + 1)}",
      "Level: #{character.level}",
      "-----------------------"
    ]
  end

  def valid_name?(name) do
    len = String.length(name)
    Regex.match?(~r/^[a-zA-Z]+$/, name)
      && 2 < len && len < 13
  end
end
