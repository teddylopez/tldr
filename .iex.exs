import Ecto.Query

alias Tldr.Api.OpenSecrets.Finance
alias Plug.Session
alias Tldr.Api
alias Api.{CapitolTrades, CongressGov, OpenSecrets}

alias Tldr.{
  Amendments,
  Bills,
  CongressMembers,
  Congresses,
  Issuers,
  Issuers.Issuer,
  LegislatorFinances,
  Legislators,
  Repo
}
