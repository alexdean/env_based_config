class EnvBasedConfig
  class << self
    
    def set_configuration( config )
      raise "Cannot set config_file twice." if @configuration
      if File.exists? config
        full_config = File.open( config ) { |yf| YAML::load( yf ) }
      else
        full_config = YAML.load( config )
      end
      @configuration = full_config[ env ]
      raise "Configuration is nil for environment '#{env}'." if ! @configuration
    end
    
    def configuration
      raise "Must call set_configuration first." if ! @configuration
      @configuration
    end
    
    def env
      Rails.configuration.environment
    end
    
    def method_missing( sym, *args, &block )
      configuration[ sym.to_s ]
    end
    
  end
end