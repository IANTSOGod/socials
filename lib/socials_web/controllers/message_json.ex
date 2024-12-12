defmodule SocialsWeb.MessageJSON do
  alias Socials.Messages.Message

  @doc """
  Renders a list of message.
  """
  def index(%{message: message}) do
    %{messages: for(message <- message, do: data(message))}
  end

  @doc """
  Renders a single message.
  """
  def show(%{message: message}) do
    %{message: data(message)}
  end

  defp data(%Message{} = message) do
    %{
      id: message.id,
      content: message.content,
      sender: message.sender_id,
      receiver: message.receiver_id
    }
  end
end
