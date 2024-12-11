defmodule Socials.Repo do
  use Ecto.Repo,
    otp_app: :socials,
    adapter: Ecto.Adapters.MyXQL
end
