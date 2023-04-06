

# Twitter Bot
Este é um bot para o Twitter desenvolvido em Elixir que permite enviar tweets e capturar tweets de um perfil selecionado.

## Configuração

Antes de iniciar a aplicação, é necessário adicionar as credenciais da API do Twitter no arquivo config/config.exs, no bloco config :twitter, :oauth:

  

    config :twitter, :oauth, [
    
    consumer_key: "YOUR_CONSUMER_KEY",
    
    consumer_secret: "YOUR_CONSUMER_SECRET",
    
    access_token: "YOUR_ACCESS_TOKEN",
    
    access_token_secret: "YOUR_ACCESS_TOKEN_SECRET"
    
    ]
    

Substitua YOUR_CONSUMER_KEY, YOUR_CONSUMER_SECRET, YOUR_ACCESS_TOKEN e YOUR_ACCESS_TOKEN_SECRET pelas credenciais fornecidas pela API do Twitter.

  

Também é possível configurar outras opções no arquivo config/config.exs, como o intervalo de tempo entre os tweets a serem enviados, o intervalo de tempo entre as pesquisas por novos tweets, entre outras opções.

  

## Uso

Para utilizar o bot, execute o seguinte comando no terminal:

  

    mix run -e "TwitterBot.Interfaces.CLI.start_link([])"

  

Isso iniciará a interface de linha de comando (CLI) do bot, que permitirá enviar tweets e capturar tweets do perfil selecionado. Para enviar um tweet, basta digitar o texto e pressionar enter. Para capturar tweets do perfil selecionado, basta digitar search e pressionar enter.

