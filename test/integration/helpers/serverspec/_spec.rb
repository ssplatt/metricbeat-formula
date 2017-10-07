require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('metricbeat') do
  it { should be_installed }
end
