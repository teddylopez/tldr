defmodule Tldr.Api.OpenSecrets.Legislator do
  import Tldr.Api.ImportHelpers

  @enforce_keys [
    :bio_id,
    :cid,
    :full_name,
    :last_name,
    :dob,
    :party,
    :office,
    :congress_office_address,
    :gender,
    :first_elected,
    :crp_exit_code,
    :comments,
    :phone,
    :fax,
    :website,
    :webform,
    :vote_smart_id,
    :fec_id,
    :x_id,
    :facebook_id,
    :youtube_url
  ]

  defstruct bio_id: nil,
            cid: nil,
            full_name: nil,
            last_name: nil,
            dob: nil,
            party: nil,
            office: nil,
            congress_office_address: nil,
            gender: nil,
            first_elected: nil,
            crp_exit_code: nil,
            comments: nil,
            phone: nil,
            fax: nil,
            website: nil,
            webform: nil,
            vote_smart_id: nil,
            fec_id: nil,
            x_id: nil,
            facebook_id: nil,
            youtube_url: nil

  def new(json_data) do
    %__MODULE__{
      bio_id: json_data["bioguide_id"],
      cid: json_data["cid"],
      full_name: json_data["firstlast"],
      last_name: json_data["lastname"],
      dob: json_data["birthdate"] |> format_date(),
      party: json_data["party"],
      office: json_data["office"],
      congress_office_address: json_data["congress_office"],
      gender: json_data["gender"],
      first_elected: json_data["firstelectoff"],
      crp_exit_code: json_data["exitcode"],
      comments: json_data["comments"],
      phone: json_data["phone"] |> format_phone_number(),
      fax: json_data["fax"] |> format_phone_number(),
      website: json_data["website"],
      webform: json_data["webform"],
      vote_smart_id: json_data["votesmart_id"],
      fec_id: json_data["feccandid"],
      x_id: json_data["twitter_id"] |> ensure_at_prefix(),
      facebook_id: json_data["facebook_id"],
      youtube_url: json_data["youtube_url"]
    }
  end

  def to_map(congress), do: Map.from_struct(congress)
end
