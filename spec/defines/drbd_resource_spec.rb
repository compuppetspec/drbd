require 'spec_helper'

describe 'drbd::resource' do
	let (:title) {'actualfile'}
	let (:facts) {{ :osfamily=> 'redhat'}}
	let (:params) {{:resource_config => '/tmp/templatefile.txt'}}
	it { should contain_class('drbd::params') }
	it { should contain_file('/etc/drbd.d/actualfile.res').with( 'ensure' => 'present','mode' => '0644', 'content' => '/tmp/templatefile.txt' )}
end
