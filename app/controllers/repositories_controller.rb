class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "0033542a0959b992d59f"
    secret = "ba6e38ba615430240e692db12f05919b852799cb
    "

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
