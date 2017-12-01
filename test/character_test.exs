defmodule CharacterTest do
  use ExUnit.Case
  doctest Character

  setup do
    character = Character.new("Tester")
    { :ok, character: character }
  end

  describe "new/1" do
    test "returns character with default stats and capitalized name" do
      character = Character.new("test")
      assert character.name == "Test"
      assert character.level == 1
      assert character.experience == 0
    end
  end

  describe "update_experience/2" do
    test "updates experience and returns level 2 character", context do
      character = context[:character]
      assert character.level == 1
      character = Character.update_experience(character, 400)
      assert character.level == 2
    end

    test "updates experience and returns level 60 character", context do
      character = context[:character]
      assert character.level == 1
      character = Character.update_experience(character, 4084700)
      assert character.level == 60
    end
  end
end
