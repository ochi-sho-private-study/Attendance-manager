# frozen_string_literal: true

I18n.load_path += Dir[Rails.root.join('config/locales/*.{rb, yml}')]

# NOTE: アプリケーションでの利用を許可するロケールのリストを渡す
I18n.available_locales = %i[en ja]

I18n.default_locale = :ja
