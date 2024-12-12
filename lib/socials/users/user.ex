defmodule Socials.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :username, :string
    field :mdp, :string
    field :email, :string

    has_many :publications, Socials.Publications.Publication
    has_many :conversation, Socials.Conversations.Conversation
    has_many :message, Socials.Messages.Message
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :mdp, :email])
    |> validate_required([:username, :mdp, :email])
    |> validate_format(:email, ~r/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
    |> unique_constraint(:email)
  end

  defimpl Jason.Encoder, for: Socials.Users.User do
    def encode(user, opts) do
      Jason.Encode.map(Map.from_struct(user), opts)
    end
  end
end
