function acr-login
  az acr login --name=finodigital --expose-token \
    | jq -r '.accessToken' \
    | nerdctl login finodigital.azurecr.io \
      -u 00000000-0000-0000-0000-000000000000 \
      --password-stdin
end
