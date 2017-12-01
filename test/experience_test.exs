defmodule ExperienceTest do
  use ExUnit.Case
  doctest Experience

  test "calculates level for experience of player" do
    Experience.level_for_experience(400)
    assert Experience.level_for_experience(400) == 1
    assert Experience.level_for_experience(58600) == 33
    assert Experience.level_for_experience(117500) == 45
  end
end
