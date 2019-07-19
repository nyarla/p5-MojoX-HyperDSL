use strict;
use warnings;

use Test2::Bundle::More;

use MojoX::HyperDSL qw[ :html5 ];

my @tests = (
  { label => 'p',
    tree  => sub { p { has { id => 'msg' }; text 'hello, world!' } },
    out   => '<p id="msg">hello, world!</p>',
  },
);

for my $test ( @tests ) {
  subtest $test->{'label'} => sub {
    is( $test->{'tree'}->()->to_string, $test->{'out'} );
  };
}

done_testing;
