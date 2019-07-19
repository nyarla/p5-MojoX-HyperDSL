package MojoX::HyperDSL;

use strict;
use warnings;

our $AUTHORITY  = 'cpan:NYARLA';
our $VERSION    = '0.01';

use Carp ();
use Mojo::DOM ();

use parent qw[ Exporter::Tiny ];

our @HTML5 = qw(
  html body

  base head link meta style title
  
  address article aside footer header
  h1 h2 h3 h4 h5 h6 hr hgroup main nav section
  
  blockquote dd div dl dt figcaption figure  li ol p pre ul
  
  a abbr b bdi bdo br cite code data dfn em i kbd mark q
  rb rt rtc ruby samp smalll span strong sub sup time u var wbr
  
  area audio img map track video
  embed iframe object picture source param
  
  canvas noscript script
  
  del ins 
  
  caption col colgroup table tbody td tfoot th thread tr 
  
  button datalist fieldset form input label legend meter optgroup
  option output progress select textarea 
  
  details dialog menu menuitem summary
  
  slot template 

  node has text
);

our @EXPORT_OK = ( @HTML5 );
our %EXPORT_TAGS = (
  html5 => \@HTML5,
);

sub html (&) { return define(html => @_) }
sub body (&) { return define(body => @_) }

sub base { return define(base => @_) }
sub head (&) { return define(head => @_) }
sub link { return define(link => @_) }
sub meta { return define(meta => @_) }
sub style (&) { return define(style => @_) }
sub title (&) { return define(title => @_) }

sub address (&) { return define(address => @_) }
sub article (&) { return define(article => @_) }
sub aside (&) { return define(aside => @_) }
sub footer (&) { return define(footer => @_) }
sub header (&) { return define(header => @_) }
sub h1 (&) { return define(h1 => @_) }
sub h2 (&) { return define(h2 => @_) }
sub h3 (&) { return define(h3 => @_) }
sub h4 (&) { return define(h4 => @_) }
sub h5 (&) { return define(h5 => @_) }
sub h6 (&) { return define(h6 => @_) }
sub hr { return define(hr => @_) }
sub hgroup (&) { return define(hgroup => @_) }
sub main (&) { return define(main => @_) }
sub nav (&) { return define(nav => @_) }
sub section (&) { return define(section => @_) }

sub blockquote (&) { return define(blockquote => @_) }
sub dd (&) { return define(dd => @_) }
sub div (&) { return define(div => @_) }
sub dl (&) { return define(dl => @_) }
sub dt (&) { return define(dt => @_) }
sub figcaption (&) { return define(figcaption => @_) }
sub figure (&) { return define(figure => @_) }
sub li (&) { return define(li => @_) }
sub ol (&) { return define(ol => @_) }
sub p (&) { return define(p => @_) }
sub pre (&) { return define(pre => @_) }
sub ul (&) { return define(ul => @_) }

sub a (&) { return define(a => @_) }
sub abbr (&) { return define(abbr => @_) }
sub b (&) { return define(b => @_) }
sub bdi (&) { return define(bdi => @_) }
sub bdo (&) { return define(bdo => @_) }
sub br { return define(br => @_) }
sub cite (&) { return define(cite => @_) }
sub code (&) { return define(code => @_) }
sub data (&) { return define(data => @_) }
sub dfn (&) { return define(dfn => @_) }
sub em (&) { return define(em => @_) }
sub i (&) { return define(i => @_) }
sub kbd (&) { return define(kbd => @_) }
sub mark (&) { return define(mark => @_) }
sub q (&) { return define(q => @_) }
sub rb (&) { return define(rb => @_) }
sub rt (&) { return define(rt => @_) }
sub rtc (&) { return define(rtc => @_) }
sub ruby (&) { return define(ruby => @_) }
sub samp (&) { return define(samp => @_) }
sub smalll (&) { return define(smalll => @_) }
sub span (&) { return define(span => @_) }
sub strong (&) { return define(strong => @_) }
sub sub (&) { return define(sub => @_) }
sub sup (&) { return define(sup => @_) }
sub time (&) { return define(time => @_) }
sub u (&) { return define(u => @_) }
sub var (&) { return define(var => @_) }
sub wbr { return define(wbr => @_) }

sub area { return define(area => @_) }
sub audio (&) { return define(audio => @_) }
sub img { return define(img => @_) }
sub map (&) { return define(map => @_) }
sub track { return define(track => @_) }
sub video (&) { return define(video => @_) }
sub embed { return define(embed => @_) }
sub iframe (&) { return define(iframe => @_) }
sub object (&) { return define(object => @_) }
sub picture (&) { return define(picture => @_) }
sub source { return define(source => @_) }
sub param { return define(param => @_) }

sub canvas (&) { return define(canvas => @_) }
sub noscript (&) { return define(noscript => @_) }
sub script (&) { return define(script => @_) }

sub del (&) { return define(del => @_) }
sub ins (&) { return define(ins => @_) }

sub caption (&) { return define(caption => @_) }
sub col { return define(col => @_) }
sub colgroup (&) { return define(colgroup => @_) }
sub table (&) { return define(table => @_) }
sub tbody (&) { return define(tbody => @_) }
sub td (&) { return define(td => @_) }
sub tfoot (&) { return define(tfoot => @_) }
sub th (&) { return define(th => @_) }
sub thread (&) { return define(thread => @_) }
sub tr (&) { return define(tr => @_) }

sub button (&) { return define(button => @_) }
sub datalist (&) { return define(datalist => @_) }
sub fieldset (&) { return define(fieldset => @_) }
sub form (&) { return define(form => @_) }
sub input { return define(input => @_) }
sub label (&) { return define(label => @_) }
sub legend (&) { return define(legend => @_) }
sub meter (&) { return define(meter => @_) }
sub optgroup (&) { return define(optgroup => @_) }
sub option (&) { return define(option => @_) }
sub output (&) { return define(output => @_) }
sub progress (&) { return define(progress => @_) }
sub select (&) { return define(select => @_) }
sub textarea (&) { return define(textarea => @_) }

sub details (&) { return define(details => @_) }
sub dialog (&) { return define(dialog => @_) }
sub menu (&) { return define(menu => @_) }
sub menuitem (&) { return define(menuitem => @_) }
sub summary (&) { return define(summary => @_) }

sub slot (&) { return define(slot => @_) }
sub template (&) { return define(template => @_) }

our $_root = undef;

sub node {
  my ( $tag, @describes ) = @_;

  my $dom = Mojo::DOM->new_tag($tag)->at($tag);

  for my $describe ( @describes ) {
    my $type = ref $describe;

    if ( $type eq q{} ) {
      $dom->append_content($describe);
      next;
    }

    if ( $type =~ m{^Mojo::DOM} ) {
      $dom->append($describe);
      next;
    }
  
    if ( $type eq 'HASH' ) {
      $dom->attr($describe);
      next;  
    }

    if ( $type eq 'ARRAY' ) {
      nest: for my $nest ( $describe->@* ) {
        if ( ref $nest =~ m{^Mojo::DOM} ) {
          $dom->append($nest);
          next nest;
        }
        
        if ( ! ref $nest ) {
          $dom->append_content($nest);
          next nest;
        }

        Carp::confess("Unsupported reference inside node's ArrayRef: ${nest}");
      }

      next;
    }
      
    Carp::confess("Unsupported reference inside node's List: ${describe}");
  }

  return $dom;
}

sub define {
  my $tag   = shift;
  my @args  = @_;

  my @attrs = grep { ref $_ eq 'HASH' } @args;
  my @blocks = grep { ref $_ eq 'CODE' } @args;

  my $dom = node $tag;
  $dom->attr($_) for @attrs;

  if ( defined $_root ) {
    $_root->append($dom);
  }

  local $_root = $dom;
  $_->() for @blocks;

  return $dom;
}

sub has {
  my %attrs = ( @_ > 1 ) ? @_ : $_[0]->%* ;

  if ( ! defined $_root ) {
    Carp::confess("this function (has) is only able to use inside element block.");
  }

  $_root->attr(%attrs);
} 

sub text {
  my @texts = @_;

  if ( ! defined $_root ) {
    Carp::confess("this function (text) is only able to use inside element block.");
  }

  $_root->append_content(join q{ }, @texts);
}

1;
__END__

=encoding utf-8

=head1 NAME

MojoX::HyperDSL - A DSL for HTML5 as Perl code based on L<Mojo::DOM>.

=head1 SYNOPSIS

    use MojoX::HyperDSL qw< :html5 >;
    
    my $dom = p { has { id => 'msg' };
      text "hello, world!";
    };

=head1 DESCRIPTION

MojoX::HyperDSL is a DSL library for HTML5 as Perl code.

This library builts on L<Mojo::DOM> by L<Mojolicious>,
and this library makes DOM tree as L<Mojo::DOM> instances.

=head1 FUNCTIONS

=head2 C<node( $tag, @describes )> -E<gt> L<Mojo::DOM>

This function makes L<Mojo::DOM> instance from L<$tag> and L<@describes> specifications.

You chould specified DOM nodes by arguments as follow:

=over

=item C<$tag>

The element name of tag by HTML5.

This argument is always required.

=item C<@describes: ( $attrs | $content | $contents )>

This arguments could be specified to attributes or contents of L<Mojo::DOM> node,
and more information about argument means as follow;

=over

=item C<$attr: HashRef>

The element attribute by HTML5.

This value is pass to L<Mojo::DOM>'s C<attr> instance method directly,
So you could to use HashRef value same as argument of L<Mojo::DOM>'s C<attr> method.

=item C<$content: Mojo::DOM | Str>

=item C<$contents: ArrayRef( Mojo::DOM | Str )>

The contents of HTML5 elememt nodes.

The content values only could specified L<Mojo::DOM> instance or C<Str> value,
and these values are able to passd by List or ArrayRef.

=back

=back

=head2 C<define( $tag, @describes )>

This function makes L<Mojo::DOM> instance like C<node>,
but element content could be specified by DSL or this function.

This function is internal used inside DSL code,
and real code of DSL are alias of this function.

This function allows these arguments as follow:

=over

=item C<$tag>

The element name of HTML5.

This value is same as C<$tag> by arguments of C<node> function.

=item C<@describes: HashRef | CodeRef >

The element attributes or contents on described element.

The attribute could be specified by HashRef like as arguments of C<node>,
But content of elements only specified by CodeRef block.

The contents of element is only added by DSL or this function is used inside CodeRef block,
and other thing does not effected to L<Mojo::DOM> tree.

So if you call C<node> function inside this function's CodeRef block,
that is not effected to L<Mojo::DOM> tree built by this function.

=back

=head1 DSL

=head2 C<has( HashRef | ListOfHash )>

This DSL is specified to attributes of described element.

The attributes could be specified by HashRef or List of Hash value.

=head2 C<text( ListOfStr )>

This DSL is specified to content text of described element.

The content text could be only specified Str values,
Or other objects are stringified.

=head1 DSL OF HTML5 TAGS

You could be used these tag names as DSL functions

  html body

  base head link meta style title
  
  address article aside footer header
  h1 h2 h3 h4 h5 h6 hr hgroup main nav section
  
  blockquote dd div dl dt figcaption figure  li ol p pre ul
  
  a abbr b bdi bdo br cite code data dfn em i kbd mark q
  rb rt rtc ruby samp smalll span strong sub sup time u var wbr
  
  area audio img map track video
  embed iframe object picture source param
  
  canvas noscript script
  
  del ins 
  
  caption col colgroup table tbody td tfoot th thread tr 
  
  button datalist fieldset form input label legend meter optgroup
  option output progress select textarea 
  
  details dialog menu menuitem summary
  
  slot template 

And notes, these DSL code has C<sub (&) { ... }> prototype of perl,
But empty elements does not have this prototype.
So you could not passed CodeRef block to DSL of empty element. Be carefully.

=head1 LICENSE

Copyright (C) OKAMURA Naoki a.k.a nyarla.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

OKAMURA Naoki a.k.a nyarla E<lt>nyarla@cpan.orgE<gt>

=cut

