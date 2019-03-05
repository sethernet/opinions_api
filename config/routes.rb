Rails.application.routes.draw do
  get "opinions" => "opinions#query"
end
