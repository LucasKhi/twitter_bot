defmodule TwitterBot.Domain.Tweet do
  defstruct [:id, :text, :user_id, :created_at]

  ## Cria uma instância de tweet com base nos dados fornecidos pelo Twitter
  def from_twitter_api(api_data) do
    %__MODULE__{
      id: api_data["id_str"],
      text: api_data["text"],
      user_id: api_data["user"]["id_str"],
      created_at: api_data["created_at"]
    }
  end
end
