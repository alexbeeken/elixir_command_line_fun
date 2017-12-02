defmodule MiniWow do
  def kill_mob(mob, character) do
    mob_exp = character.level * 5 + 45
    Console.message "You killed #{mob.name}."
    Character.update_experience(character, mob_exp)
  end

  def main(_args) do
    %{ name: Interface.ask_for_name }
    |> State.new
    |> Interface.menu("main")
  end
end
