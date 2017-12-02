defmodule ExperienceTest do
  use ExUnit.Case
  doctest Experience

  describe "Experience.progress_bar/1" do
    test "shows 10 bars for 50% of level" do
      assert Experience.progress_bar(200, 1) == "[ ##########---------- ]"
    end

    test "shows 15 bars for 75% of level" do
      assert Experience.progress_bar(300, 1) == "[ ###############----- ]"
    end

    test "shows 19 bars for 99% of level" do
      assert Experience.progress_bar(399, 1) == "[ ################### ]"
    end
  end

  describe "Experience.level_for_experience/1" do
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

    test "returns correct level for 4084700 experience" do
      assert Experience.level_for_experience(4084700) == 60
    end
  end

  describe "Experience.experience_for_level/1" do
    test "returns min experience for level 1" do
      assert Experience.experience_for_level(1) == 0
    end

    test "returns min experience for level 2" do
      assert Experience.experience_for_level(2) == 400
    end

    test "returns min experience for level 60" do
      assert Experience.experience_for_level(60) == 4084700
    end
  end
end
