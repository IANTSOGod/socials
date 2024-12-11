defmodule SocialsWeb.AuthController do
    use SocialsWeb, :controller
  
    alias Socials.Users
    alias Socials.Users.User
  
    action_fallback SocialsWeb.FallbackController
    
    def login(conn, params) do
      with %{"email" => email, "mdp" => mdp} <- params do
        case Users.get_user_by_email(email) do
          nil ->
            conn
            |> put_status(:not_found)
            |> json(%{message: "User not found"})
    
          %User{} = user ->
            if decrypt(mdp, user.mdp) do
              conn
              |> put_status(:ok)
              |> json(%{
                id: user.id,
                username: user.username,
                email: user.email
              })
            else
              conn
              |> put_status(:unauthorized)
              |> json(%{message: "Mot de passe incorrect"})
            end
        end
      else
        _ ->
          conn
          |> put_status(:bad_request)
          |> json(%{message: "Arguments manquants"})
      end
    end
    
    def decrypt(mdp, hashed_password) do
      Bcrypt.verify_pass(mdp, hashed_password)
    end
    
  end
  