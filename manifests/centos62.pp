include epel

package { "python-pip":
    ensure => "present",
    require => Yumrepo["epel"],
}

file { "/usr/bin/pip":
    ensure => "/usr/bin/pip-python",
    require => Package["python-pip"],
}

package { ["gcc","git","python-devel"]:
    ensure => present,
}

package { "beaver":
    provider => "pip",
    source => "git+git://github.com/josegonzalez/beaver.git#egg=beaver",
    require => [Package["python-pip"],File["/usr/bin/pip"],Package["gcc"]],
}

#exec { "beaver_install":
#command => "/usr/bin/pip-python install git+git://github.com/josegonzalez/beaver.git#egg=beaver",
#creates => "/usr/bin/beaver",
#require => [Package["python-pip"],Package["git"]],
#}

    
