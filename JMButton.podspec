

Pod::Spec.new do |s|

  s.name         = "JMButton"
  s.version      = "0.1"
  s.summary      = "超强自定义Button"

  s.description  = <<-DESC
  					   * 自定义图片上下左右位置
  					   * 自定义文字和图片间距
  					   * 自定义角标动画
                   DESC

  s.homepage     = "https://github.com/JunAILiang/JMButton.git"

  s.license      = "MIT"

  s.author             = { "LJM" => "gzliujm@163.com" }

  s.platform	= :ios, "8.0"

  s.source       = { :git => "https://github.com/JunAILiang/JMButton.git", :tag => "#{s.version}" }

  s.source_files  = "JMButton/JMButton/**/*.{h,m}"

  s.requires_arc = true

end
