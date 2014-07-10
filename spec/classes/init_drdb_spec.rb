require 'spec_helper'

describe 'drbd' do
	context 'With redhat operating system' do
		let (:facts) {{ :osfamily=> 'redhat'}}
		let (:params) {{:drbd_kernel_package => 'kmod-drbd84',:drbd_kernel_package_ensure => 'installed',:drbd_package => 'drbd84-utils',\
		:drbd_package_ensure => 'installed',:drbd_service => 'drbd',:drbd_service_ensure => 'running',:drbd_service_enable =>'true'}}
		it { should contain_class('drbd')}	
		it { should contain_package('kmod-drbd84').with_ensure('installed') }
		it { should contain_package('drbd84-utils').with_ensure('installed').that_requires('Package[kmod-drbd84]') }
		it { should contain_service('drbd').with('ensure' => 'running','enable' => 'true').that_requires('Package[drbd84-utils]') }

	end


	context 'With Unsupported operating system' do
		let (:facts) {{ :osfamily=> 'solaris',:operatingsystem =>'solaris',:module_name => 'drbd'}}
			it do
               expect {should compile}.to raise_error(Puppet::Error, /Module drbd is not supported on solaris/)
            end	
	end
end
