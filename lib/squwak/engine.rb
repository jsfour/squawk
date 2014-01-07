module Squwak

	class Engine < ::Rails::Engine
		isolate_namespace Squwak
		config.autoload_paths << File.expand_path("../lib", __FILE__)
	end

end