# frozen_string_literal: true
Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'pages#index'

    get 'pages/sign', path: 'sign'
    get 'coders/verify', path: 'verify'
    get 'pages/check', path: 'check'

    resources :coders
  end
end
