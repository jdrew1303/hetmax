setting = (env_variable, default_value) ->
  process.env[env_variable] or default_value

global.settings =

  port: setting 'PORT', 3000
  db_port: setting 'DB_PORT', 27017
  db_server: setting 'DB_SERVER', 'localhost'

settings.db = "#{settings.db_server}:#{settings.db_port}"