defmodule Socials.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :username, :string
    field :mdp, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :mdp, :email])
    |> validate_required([:username, :mdp, :email])
    |> validate_format(:email, ~r/@/) 
    |> unique_constraint(:email) 
  end

  defimpl Jason.Encoder, for: Socials.Users.User do
    def encode(user, opts) do
      Jason.Encode.map(Map.from_struct(user), opts)
    end
  end
end
