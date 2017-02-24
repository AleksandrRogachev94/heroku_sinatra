require 'bundler/setup'
Bundler.require

#ActiveRecord::Base.establish_connection(:development)
# configure :production, :development do
# 	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
#
# 	ActiveRecord::Base.establish_connection(
# 			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
# 			:host     => db.host,
# 			:username => db.user,
# 			:password => db.password,
# 			:database => db.path[1..-1],
# 			:encoding => 'utf8'
# 	)
# end

configure :development do
	db_config = YAML.load(ERB.new(File.read('config/database.yml')).result)['development']
	ActiveRecord::Base.establish_connection(db_config)
end

configure :production do
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/posts_development2')

	ActiveRecord::Base.establish_connection(
	  adapter: db.scheme == 'postgres' ? 'postgresql' : db.scheme,
	  host: db.host,
	  username: db.user,
	  password: db.password,
	  database: db.path[1..-1],
	  encoding: 'utf8'
	)
end

# configure :production, :development do
# 	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/posts_development2')
#
# 	ActiveRecord::Base.establish_connection(
# 	  adapter: db.scheme == 'postgres' ? 'postgresql' : db.scheme,
# 	  host: db.host,
# 	  username: db.user,
# 	  password: db.password,
# 	  database: db.path[1..-1],
# 	  encoding: 'utf8'
# 	)
# end

require_all 'app'
