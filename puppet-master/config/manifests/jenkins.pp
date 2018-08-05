include wget
class jenkins {

        wget::fetch { "Download Jenkins repo":
                source => 'https://pkg.jenkins.io/redhat-stable/jenkins.repo',
                destination => '/etc/yum.repos.d/jenkins.repo',
        }

        rpmkey { '6A656E6B696E732E696F2E6B6579':
                ensure => 'present',
                source => 'https://pkg.jenkins.io/redhat-stable/jenkins.io.key'
        }

        package { 'jenkins':
                ensure => 'present',
        }

        service { 'jenkins':
                ensure => 'running',
        }
}
