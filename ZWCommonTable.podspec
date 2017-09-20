Pod::Spec.new do |s|
	s.name		= 'ZWCommonTable'
	s.version	= '1.0.1'
	s.summary	= '更简洁、快速的实现静态TableView页面、JSON式写法让你随意增、删、改静态cell.'
	s.homepage 	= 'https://github.com/wangziwu/ZWCommonTableDemo'
	s.license	= 'MIT'
	s.authors	= {'wangziwu'	=>	'wang_ziwu@126.com'}
	s.platform	= :ios,'8.0'
	s.ios.deployment_target = '8.0'
	s.source	= {:git => 'https://github.com/wangziwu/ZWCommonTableDemo.git',:tag => s.version,:submodules => true }
	s.source_files	= 'ZWCommonTable/ZWCommonTable.h'
	s.resources    	= 'ZWCommonTable/**/*.{png,xib,nib,bundle}'
	s.requires_arc	= true

	s.subspec 	'ZWCore' do |ss|
		ss.source_files = 'ZWCommonTable/ZWCore/*.{h,m}'
	end

	s.subspec	'Protocol' do |ss|
		ss.source_files = 'ZWCommonTable/Protocol/*.{h,m}'
	end

	s.subspec	'ZWStaticCell' do |ss|
		ss.source_files = 'ZWCommonTable/ZWStaticCell/*.{h,m}'
	end

	s.subspec	'ZWStaticModel' do |ss|
		ss.source_files = 'ZWCommonTable/ZWStaticModel/*.{h,m}'
	end
end	
