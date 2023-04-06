defmodule TwitterBot.Adapters.TwitterAdapter do
  use ExTwitter

  ## Envia um tweet com o texto fornecido
  def send_tweet(tweet_text) do
    ExTwitter.Status.update(tweet_text)
  end

  ## Busca por tweets com base na consulta fornecida e no número de resultados a serem retornados
  def search_tweets(query, count \\ 10) do
    ExTwitter.Search.search(query, count: count)
  end

  ## Busca por tweets com base na consulta fornecida e retorna apenas os tweets que foram publicados desde a data fornecida
  def search_tweets_since(query, since_id) do
    ExTwitter.Search.search(query, since_id: since_id)
  end

  ## Retorna o perfil do usuário com o nome de usuário fornecido
  def get_user(username) do
    ExTwitter.Users.show(username)
  end

  ## Retorna o perfil do usuário com o ID fornecido
  def get_user_by_id(user_id) do
    ExTwitter.Users.show(user_id)
  end

  ## Segue o perfil do usuário com o nome de usuário fornecido
  def follow_user(username) do
    ExTwitter.Friendships.create(username)
  end

  ## Deixa de seguir o perfil do usuário com o nome de usuário fornecido
  def unfollow_user(username) do
    ExTwitter.Friendships.destroy(username)
  end

  ## Retorna uma lista de perfis de usuário que seguem o perfil do usuário com o nome de usuário fornecido
  def get_followers(username) do
    ExTwitter.Friendships.followers(username)
  end

  ## Retorna uma lista de perfis de usuário que o perfil do usuário com o nome de usuário fornecido segue
  def get_friends(username) do
    ExTwitter.Friendships.friends(username)
  end

  ## Retorna uma lista de tweets que mencionam o perfil do usuário com o nome de usuário fornecido
  def get_mentions(username) do
    ExTwitter.Search.search("@#{username}")
  end

  ## Retorna uma lista de tweets que foram enviados pelo perfil do usuário com o nome de usuário fornecido
  def get_tweets_by_user(username) do
    ExTwitter.Statuses.user_timeline(username)
  end

  ## Retorna uma lista de tweets que foram enviados pelo perfil do usuário com o ID fornecido
  def get_tweets_by_user_id(user_id) do
    ExTwitter.Statuses.user_timeline(user_id)
  end
end
