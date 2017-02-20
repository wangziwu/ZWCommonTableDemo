Pod::Spec.new do |s|
	s.name		= 'ZWCommonTable'
	s.version	= '0.0.3'
	s.summary	= 'An easy way to use common TableViewViewController'
	s.homepage 	= 'https://github.com/wangziwu/ZWCommonTableDemo'
	s.license	= 'MIT'
	s.authors	= {'wangziwu'	=>	'wang_ziwu@126.com'}
	s.platform	= :ios,'7.0'
	s.ios.deployment_target = '7.0'
	s.source	= {:git => 'https://github.com/wangziwu/ZWCommonTableDemo.git',:tag => s.version}
	s.source_files	= 'ZWCommonTable/*.{h,m}'
	s.resources    	= 'ZWCommonTable/*.{png,xib,nib,bundle}'
	s.requires_arc	= true

end	
