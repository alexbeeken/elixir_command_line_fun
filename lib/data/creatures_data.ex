defmodule CreaturesData do
  def next_random(state) do
    %{
      entry: 6,
      name: "Kobold Vermin",
      max_level: 2,
      min_level: 1,
      exp: state.character.level * 5 + 45
    }
  end
end
