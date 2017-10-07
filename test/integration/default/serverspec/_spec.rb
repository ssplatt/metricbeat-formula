require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/etc/metricbeat/metricbeat.yml') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:sha256sum) { should eq '772c4b28a988072e75801891a326f37e318272b2152c2f9a6986259f68c40a90' }
end

describe service('metricbeat') do
  it { should_not be_enabled }
  it { should_not be_running }
end
