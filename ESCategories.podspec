Pod::Spec.new do |s|

s.name         = 'ESCategories'
s.version      = '0.1.7'
s.summary      = 'D2C iOS拓展分类.'
s.homepage     = 'https://github.com/D2C-iOS/Categories'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { 'cezres' => 'cezres@163.com' }

s.platform     = :ios, '7.0'
s.source       = { :git => 'https://github.com/D2C-iOS/Categories.git', :tag => s.version }
s.source_files = 'Categories/**/*.{h,m}'
s.requires_arc = true
s.public_header_files = 'Categories/**/*.h'

end

