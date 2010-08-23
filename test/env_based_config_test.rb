require 'test/unit'
require 'yaml'
require File.dirname(__FILE__) + '/../lib/env_based_config'

class EnvBasedConfigTest < Test::Unit::TestCase
  
  def setup
    @yaml_string = "--- \nproduction: \n  port: 80\n  server: production\ntest: \n  port: 8080\n  server: test\n"
    @subject = Class.new( EnvBasedConfig )
    def @subject.env; "test"; end
    @subject.set_configuration @yaml_string
  end
  
  def test_full_configuration_is_available
    assert_equal( { 'server'=>'test', 'port'=>8080 }, @subject.configuration )
  end
  
  def test_cannot_set_configuration_twice
    assert_raises RuntimeError do
      @subject.set_configuration 'anything'
    end
  end
  
  def test_should_select_configuration_section_based_on_env
    @subject = Class.new( EnvBasedConfig )
    def @subject.env; "production"; end
    @subject.set_configuration @yaml_string
    assert_equal( { 'server'=>'production', 'port'=>80 }, @subject.configuration )
  end
  
  def test_typical_usage
    assert_equal "test", @subject.server
    assert_equal 8080, @subject.port
  end
  
end
