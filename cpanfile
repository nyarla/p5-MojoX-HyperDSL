# vim: ft=perl
requires 'perl', '5.030000';

requires 'Mojolicious'      => '8.22';
requires 'Mojo::DOM'        => '0';
requires 'Exporter::Tiny'   => '1.002001';
requires 'Exporter::Shiny'  => '0';

on 'test' => sub {
    requires 'Test2::Suite'         => '0.000122';
    requires 'Test2::Bundle::More'  => '0';
};

on 'develop' => sub {
  requires 'Minilla' => '0';
  requires 'Software::License' => '0';
};
