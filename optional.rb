# frozen_string_literal: true

def stylesheet_tag_for(tag_name)
  "<%= stylesheet_#{tag_name}_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' >"
end

if yes?('デフォルトでcss(sass)をwebpackで管理するように設定しますか？ (y/n)')
  gsub_file 'app/views/layouts/application.html.erb',
            stylesheet_tag_for('link'),
            stylesheet_tag_for('pack')

  run 'mkdir -p app/javascript/stylesheets && touch app/javascript/stylesheets/application.scss'

  inject_into_file 'app/javascript/packs/application.js', "import '../stylesheets/application'\n",
                   before: /^Rails.start()/
end
