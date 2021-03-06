require 'dockerspec/serverspec'

describe "Dockerfile" do
  describe docker_build('.', tag: 'nerdnobs/ubuntu', log_level: :ci) do
    it { should have_maintainer 'NerdNobs "docker@nerdnobs.com"' }
    it { should have_cmd ['/bin/bash'] }
    describe docker_run('nerdnobs/ubuntu', log_level: :ci) do
      describe package('wget') do
        it { should be_installed }
      end
      describe package('curl') do
        it { should be_installed }
      end
      describe command('lsb_release -ri') do
        its(:stdout) { should match /^Distributor ID:\s+Ubuntu/ }
        its(:stdout) { should match /^Release:\s+14\./ }
      end
    end
  end
end
