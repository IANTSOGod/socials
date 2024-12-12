defmodule SocialsWeb.ConversationJSON do
  alias Socials.Conversations.Conversation

  @doc """
  Renders a list of conversation.
  """
  def index(%{conversation: conversation}) do
    %{data: for(conversation <- conversation, do: data(conversation))}
  end

  @doc """
  Renders a single conversation.
  """
  def show(%{conversation: conversation}) do
    %{data: data(conversation)}
  end

  defp data(%Conversation{} = conversation) do
    %{
      id: conversation.id,
      user_id_1: conversation.user_id_1,
      user_id_2: conversation.user_id_2
    }
  end
end
