Rails.application.routes.draw do

root 'pages#index'

get 'pages/sign', :path => "sign"
get 'coders/verify', :path => "verify"
get 'pages/check', :path => "check"

resources :coders

end
