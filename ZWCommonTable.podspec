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
	s.requires_arc	= true

	s.source_files	= 'ZWCommonTable/**/*.h'
	s.public_header_files = 'ZWCommonTable/ZWCommonTable.h'
	s.resources    	= 'ZWCommonTable/**/*.{png,xib,nib,bundle}'

	# s.subspec 'ZWCore' do |ss|
	# 	ss.source_files = 'ZWCommonTable/ZWCore/ZWCommon{Config,TableCtr,TableData,TableDelegate}.{h,m}'
	# end

	# s.subspec 'Protocol' do |ss|
	# 	ss.source_files = 'ZWCommonTable/Protocol/ZW{CommonTableCellProtocol,StaticModelProtocol}.h'
	# end

	# s.subspec 'ZWStaticCell' do |ss|
	# 	ss.source_files = 'ZWCommonTable/ZWStaticCell/*.{h,m}'
	# end

	# s.subspec 'ZWStaticModel' do |ss|
	# 	ss.source_files = 'ZWCommonTable/ZWStaticModel/*.{h,m}'
	# end
	s.frameworks = 'UIKit'
end	
