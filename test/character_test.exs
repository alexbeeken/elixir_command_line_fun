defmodule CharacterTest do
  use ExUnit.Case
  doctest Character

  setup do
    { :ok, character } = Character.new("Tester")
    { :ok, character: character }
  end

  describe "valid_name/1" do
    test "true case" do
      assert Character.valid_name?("testerson") == true
    end

    test "true if capital letters" do
      assert Character.valid_name?("TeSt") == true
    end

    test "false if spaces" do
      assert Character.valid_name?("test ") == false
    end

    test "names are < 12 characters" do
      assert Character.valid_name?("toomanycharacters") == false
    end

    test "names are > 2 characters" do
      assert Character.valid_name?("no") == false
    end
  end

  describe "new/1" do
    test "returns character with default stats and capitalized name" do
      { :ok, character } = Character.new("test")
      assert character.name == "Test"
      assert character.level == 1
      assert character.experience == 0
    end

    test "returns error tuple on invalid name" do
      { :error, message } = Character.new("test ")
      assert message = "Name should be between 3 - 12 characters and only contain letters."
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
