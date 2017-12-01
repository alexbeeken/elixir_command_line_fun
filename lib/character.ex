defmodule Character do
  def new(name) do
    %{
      name: name,
      experience: 0,
      level: 1
    }
  end

  def update_experience(character, gained) do
    xp = character.experience + gained
    IO.puts "Level up? #{level_up?(character)}"
    %{ character | experience: xp }
  end

  def level_up?(character) do
    character.experience < Experience.level_for_experience(character.experience)
  end
end
