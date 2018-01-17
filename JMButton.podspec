

Pod::Spec.new do |s|

  s.name         = "JMButton"
  s.version      = "0.2"
  s.summary      = "超强自定义Button"

  s.description  = <<-DESC
  					   * 新增自定义View
               * 新增倒计时功能
                   DESC

  s.homepage     = "https://github.com/JunAILiang/JMButton.git"

  s.license      = "MIT"

  s.author             = { "LJM" => "gzliujm@163.com" }

  s.platform	= :ios, "8.0"

  s.source       = { :git => "https://github.com/JunAILiang/JMButton.git", :tag => "#{s.version}" }

  s.source_files  = "JMButton/JMButton/**/*.{h,m}"

  s.requires_arc = true

end
