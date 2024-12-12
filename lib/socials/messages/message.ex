defmodule Socials.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message" do
    field :content, :string
    belongs_to :user1, Socials.Users.User, foreign_key: :sender_id
    belongs_to :user2, Socials.Users.User, foreign_key: :receiver_id
    belongs_to :conversation, Socials.Conversations.Conversation, foreign_key: :conv_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :sender_id, :receiver_id, :conv_id])
    |> validate_required([:content, :sender_id, :receiver_id, :conv_id])
  end
end
