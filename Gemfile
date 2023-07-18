source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.5"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.5.3"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # 検査基準・対象なども調整できる https://zenn.dev/tmasuyama1114/books/ab51fea5d5f659/viewer/rubocop
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "dockerfile-rails", ">= 1.5", :group => :development

#環境変数の設定（openするべきではないものを入れるところ https://pikawaka.com/rails/dotenv-rails）
gem "dotenv-rails"

gem "list"

# 利用規約とプライバシーポリシーの静的ページ作成　
gem "high_voltage"

# ユーザー機能認証
gem 'devise'
#ログイン認証の日本語表示 公式：https://github.com/tigrish/devise-i18n　記事：https://karlley.hatenablog.jp/entry/2022/09/23/060408
gem 'devise-i18n'

#google_loginようにgem　公式：https://github.com/zquestz/omniauth-google-oauth2 参考：https://qiita.com/akioneway94/items/35641ad30c2acb23b562　
gem 'omniauth-google-oauth2'
#上記のgemの問題点改善 公式：https://rubygems.org/gems/omniauth-rails_csrf_protection/versions/0.1.0?locale=ja　参考：https://qiita.com/NT90957869/items/2a3ce18dedf93ccf2bdc
gem "omniauth-rails_csrf_protection"

# i18n
gem "rails-i18n", "~> 7.0.0"

# Google公式のgem 公式：https://github.com/googleapis/google-auth-library-ruby
gem "googleauth"

# configを使った定数管理の方法 https://qiita.com/sazumy/items/8d3b06d0d42af114a383
gem "config"

#SEO
gem 'meta-tags'

#画像アップロード
gem 'carrierwave'
gem 'mini_magick'