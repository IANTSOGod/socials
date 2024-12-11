defmodule SocialsWeb.UserJSON do
  alias Socials.Users.User

  @doc """
  Renders a list of user.
  """
  def index(%{user: user}) do
    %{users: for(user <- user, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{user: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      username: user.username,
      mdp: user.mdp,
      email: user.email
    }
  end

end
