defmodule SocialsWeb.UserController do
  use SocialsWeb, :controller

  alias Socials.Users
  alias Socials.Users.User
  alias Bcrypt

  action_fallback SocialsWeb.FallbackController

  def index(conn, _params) do
    users = Users.list_user()
    render(conn, :index, users: users)
  end

  def hash_password(mdp) do
    Bcrypt.hash_pwd_salt(mdp)
  end

  def create(conn, %{"user" => user_params}) do
    hashed_password = hash_password(user_params["mdp"])
    new_user = %{
      username: user_params["username"],
      mdp: hashed_password,
      email: user_params["email"]
    }

    with {:ok, %User{} = user} <- Users.create_user(new_user) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/user/#{user.id}")
      |> render(:show, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    render(conn, :show, user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)

    with {:ok, %User{} = user} <- Users.update_user(user, user_params) do
      render(conn, :show, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)

    with {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def get_by_email(conn, %{"email" => email}) do
    with user when not is_nil(user) <- Users.get_user_by_email(email) do
      conn
      |> put_status(:ok)
      |> json(%{
        id: user.id,
        username: user.username,
        email: user.email,
        mdp: user.mdp
      })
    else
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{message: "Email non enregistré"})

      _ ->
        conn
        |> put_status(:bad_request)
        |> json(%{message: "Une erreur est survenue. Veuillez vérifier les données envoyées."})
    end
  end

  def get_by_email(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: "Le champ 'email' est obligatoire."})
  end
end
