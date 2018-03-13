

Pod::Spec.new do |s|

  s.name         = "JMButton"
  s.version      = "0.6"
  s.summary      = "超强自定义Button"

  s.description  = <<-DESC
  					修复设置tag值无效问题
                   DESC

  s.homepage     = "https://github.com/JunAILiang/JMButton.git"

  s.license      = "MIT"

  s.author             = { "LJM" => "gzliujm@163.com" }

  s.platform	= :ios, "8.0"

  s.source       = { :git => "https://github.com/JunAILiang/JMButton.git", :tag => "#{s.version}" }

  s.source_files  = "JMButton/JMButton/**/*.{h,m}"

  s.requires_arc = true

end
