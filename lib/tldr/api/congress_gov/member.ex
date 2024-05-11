defmodule Tldr.Api.CongressGov.Member do
  @enforce_keys [
    :bio_id,
    :name,
    :state,
    :party,
    :district,
    :headshot,
    :terms,
    :url
  ]

  defstruct bio_id: nil,
            name: nil,
            state: nil,
            party: nil,
            district: nil,
            terms: %{},
            headshot: nil,
            url: nil

  def new(json_data) do
    %__MODULE__{
      bio_id: json_data["bioguideId"],
      name: json_data["name"],
      state: json_data["state"],
      party: json_data["partyName"],
      terms: parse_terms(json_data) || [],
      district: json_data["district"],
      headshot: json_data["depiction"]["imageUrl"],
      url: json_data["url"]
    }
  end

  def to_map(congress) do
    Map.from_struct(congress)
  end

  def parse_terms(json_data) do
    %{"item" => list} = json_data["terms"]

    list
    |> Enum.map(&Tldr.Api.CongressGov.Term.new/1)
    |> Enum.map(&Tldr.Api.CongressGov.Term.to_map/1)
  end
end
