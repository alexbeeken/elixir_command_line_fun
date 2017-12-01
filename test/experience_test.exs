defmodule ExperienceTest do
  use ExUnit.Case
  doctest Experience

  test "returns correct level for 399 experience" do
    assert Experience.level_for_experience(399) == 1
  end

  test "returns correct level for 400 experience" do
    assert Experience.level_for_experience(400) == 2
  end

  test "returns correct level for 401 experience" do
    assert Experience.level_for_experience(401) == 2
  end

  test "returns correct level for 1299 experience" do
    assert Experience.level_for_experience(1299) == 2
  end

  test "returns correct level for 1300 experience" do
    assert Experience.level_for_experience(1300) == 3
  end

  test "returns correct level for 1301 experience" do
    assert Experience.level_for_experience(1301) == 3
  end

  test "returns min experience for level 2" do
    assert Experience.experience_for_level(2) == 1300
  end
end
