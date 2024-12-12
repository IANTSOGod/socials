defmodule Socials.Conversations.Conversation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "conversation" do
    belongs_to :user1, Socials.Users.User, foreign_key: :user_id_1
    belongs_to :user2, Socials.Users.User, foreign_key: :user_id_2

    has_many :message, Socials.Messages.Message

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(conversation, attrs) do
    conversation
    |> cast(attrs, [:user_id_1, :user_id_2])
    |> validate_required([:user_id_1, :user_id_2])
  end
end
