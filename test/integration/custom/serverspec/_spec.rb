require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/etc/metricbeat/metricbeat.yml') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match /^metricbeat\.modules:/ }
    its(:content) { should match /^- enabled: true/ }
    its(:content) { should match /^  module: system/ }
    its(:content) { should match /^  metricsets:/ }
    its(:content) { should match /^  - cpu/ }
    its(:content) { should match /^  - load/ }
    its(:content) { should match /^  - core/ }
    its(:content) { should match /^  - diskio/ }
    its(:content) { should match /^  - filesystem/ }
    its(:content) { should match /^  - fsstat/ }
    its(:content) { should match /^  - memory/ }
    its(:content) { should match /^  - network/ }
    its(:content) { should match /^  - process/ }
    its(:content) { should match /^  period: 10s/ }
    its(:content) { should match /^  processes:\n  - \.\*/ }
    its(:content) { should match /^output\.elasticsearch:/ }
    its(:content) { should match /^  hosts:\n  - localhost:9200/ }
    its(:content) { should match /^logging\.to_files: true/ }
    its(:content) { should match /^logging\.files: \{\}/ }
end

describe service('metricbeat') do
  it { should be_enabled }
  it { should be_running }
end
