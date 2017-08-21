Pod::Spec.new do |s|
	s.name		= 'ZWCommonTable'
	s.version	= '1.0.0'
	s.summary	= '更简洁、快速的实现静态TableView页面、JSON式写法让你随意增、删、改静态cell.'
	s.homepage 	= 'https://github.com/wangziwu/ZWCommonTableDemo'
	s.license	= 'MIT'
	s.authors	= {'wangziwu'	=>	'wang_ziwu@126.com'}
	s.platform	= :ios,'8.0'
	s.ios.deployment_target = '8.0'
	s.source	= {:git => 'https://github.com/wangziwu/ZWCommonTableDemo.git',:tag => s.version}
	s.source_files	= 'ZWCommonTable/*.{h,m}'
	s.resources    	= 'ZWCommonTable/*.{png,xib,nib,bundle}'
	s.requires_arc	= true

end	
