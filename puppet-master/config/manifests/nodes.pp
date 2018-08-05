node 'default' {
}

node 'puppet-agent-java.com.br' {
        include vim
        include java7
}

node 'puppet-agent-jenkins.com.br' {
        include vim
        include java8
        include jenkins
}
