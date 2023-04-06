defmodule TwitterBot.Domain.User do
  defstruct [:id, :username, :name, :location, :description]

  ## Cria uma instância de usuário com base nos dados fornecidos pelo Twitter
  def from_twitter_api(api_data) do
    %__MODULE__{
      id: api_data["id_str"],
      username: api_data["screen_name"],
      name: api_data["name"],
      location: api_data["location"],
      description: api_data["description"]
    }
  end
end
