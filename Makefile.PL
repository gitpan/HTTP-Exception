
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "throw HTTP-Errors as (Exception::Class-) Exceptions",
  "AUTHOR" => "Thomas M\374ller <tmueller\@cpan.org>",
  "BUILD_REQUIRES" => {
    "HTTP::Exception::200" => 0,
    "HTTP::Exception::405" => 0,
    "HTTP::Request::Common" => 0,
    "Plack::Middleware::HTTPExceptions" => 0,
    "Plack::Test" => 0,
    "Test::Exception" => 0,
    "Test::More" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "HTTP-Exception",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "HTTP::Exception",
  "PREREQ_PM" => {
    "Exception::Class" => 0,
    "Exception::Class::Base" => 0,
    "HTTP::Status" => 0,
    "Scalar::Util" => 0,
    "base" => 0,
    "strict" => 0
  },
  "VERSION" => "0.04",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



