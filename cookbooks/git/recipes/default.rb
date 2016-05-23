OS_name=node['platform']
OS_family=node['platform_family']
OS_ver=node['platform_version'].to_f
# log 'print OS info' do
#   message "OS_name=#{OS_name}, OS_family=#{OS_family} ver=#{OS_ver}"
#   level :info
# end

IsWindows = %w{windows}.include?(OS_name)

if IsWindows
	windows_package 'Git x64' do
		source 'https://github.com/git-for-windows/git/releases/download/v2.8.3.windows.1/Git-2.8.3-64-bit.exe'
		installer_type :inno
		options '/SUPPRESSMSGBOXES /SILENT'
	end
else
	package 'git' do
		action :install
	end

	package 'git-svn' do
		action :install
	end
end
