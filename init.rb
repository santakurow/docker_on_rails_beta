generate "rspec:install"

application do 
  <<-EOS
    # ジェネレーターを設定
    config.generators do |g|
      g.helper false
      g.test_framework :rspec
    end

    # タイムゾーンの設定
    config.time_zone = 'Asia/Tokyo'
    config.active_record.default_timezone = :local
  EOS
end

gsub_file 'config/database.yml', "username: root", 
          "username: <%= ENV.fetch('MYSQL_USERNAME', 'root') %>"

gsub_file 'config/database.yml', /password:$/, 
          "password: <%= ENV.fetch('MYSQL_PASSWORD', 'password') %>"

gsub_file 'config/database.yml', "host: localhost", 
          "host: <%= ENV.fetch('MYSQL_HOST', 'db') %>"

run "cat config/database.yml"
