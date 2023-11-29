Pod::Spec.new do |s|

    s.name        = 'SBCodableWrappers'
    s.version     = '1.0.2'
    s.summary     = 'A lightweight and pure Swift implemented library using PropertyWrappers to make custom Serialization of Swift Codable Types easy.'
  
    s.description = <<-DESC
                         SBCodableWrappers is a lightweight and pure Swift implemented library using PropertyWrappers to make custom Serialization of Swift Codable Types easy.
                         DESC
  
    s.homepage    = 'https://github.com/spirit-jsb/SBCodableWrappers'
    
    s.license     = { :type => 'MIT', :file => 'LICENSE' }
    
    s.author      = { 'spirit-jsb' => 'sibo_jian_29903549@163.com' }
    
    s.swift_versions = ['5.0']
    
    s.ios.deployment_target = '11.0'
      
    s.source       = { :git => 'https://github.com/spirit-jsb/SBCodableWrappers.git', :tag => s.version }
    s.source_files = ["Sources/**/*.swift"]
    
    s.requires_arc = true
  end
  
