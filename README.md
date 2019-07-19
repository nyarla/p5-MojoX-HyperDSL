# NAME

MojoX::HyperDSL - A DSL for HTML5 as Perl code built on [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM).

# SYNOPSIS

    use MojoX::HyperDSL qw< :html5 >;
    
    my $dom = p { has { id => 'msg' };
      text "hello, world!";
    };

# DESCRIPTION

MojoX::HyperDSL is a DSL library for HTML5 as Perl code.

This library builts on [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM) by [Mojolicious](https://metacpan.org/pod/Mojolicious),
and this library makes DOM tree as [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM) instances.

# FUNCTIONS

## `node( $tag, @describes )` -> [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM)

This function makes [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM) instance from [$tag](https://metacpan.org/pod/$tag) and [@describes](https://metacpan.org/pod/@describes) specifications.

You chould specified DOM nodes by arguments as follow:

- `$tag`

    The element name of tag by HTML5.

    This argument is always required.

- `@describes: ( $attrs | $content | $contents )`

    This arguments could be specified to attributes or contents of [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM) node,
    and more information about argument means as follow;

    - `$attr: HashRef`

        The element attribute by HTML5.

        This value is pass to [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM)'s `attr` instance method directly,
        So you could to use HashRef value same as argument of [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM)'s `attr` method.

    - `$content: Mojo::DOM | Str`
    - `$contents: ArrayRef( Mojo::DOM | Str )`

        The contents of HTML5 elememt nodes.

        The content values only could specified [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM) instance or `Str` value,
        and these values are able to passd by List or ArrayRef.

## `define( $tag, @describes )`

This function makes [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM) instance like `node`,
but element content could be specified by DSL or this function.

This function is internal used inside DSL code,
and real code of DSL are alias of this function.

This function allows these arguments as follow:

- `$tag`

    The element name of HTML5.

    This value is same as `$tag` by arguments of `node` function.

- `@describes: HashRef | CodeRef `

    The element attributes or contents on described element.

    The attribute could be specified by HashRef like as arguments of `node`,
    But content of elements only specified by CodeRef block.

    The contents of element is only added by DSL or this function is used inside CodeRef block,
    and other thing does not effected to [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM) tree.

    So if you call `node` function inside this function's CodeRef block,
    that is not effected to [Mojo::DOM](https://metacpan.org/pod/Mojo::DOM) tree built by this function.

# DSL

## `has( HashRef | ListOfHash )`

This DSL is specified to attributes of described element.

The attributes could be specified by HashRef or List of Hash value.

## `text( ListOfStr )`

This DSL is specified to content text of described element.

The content text could be only specified Str values,
Or other objects are stringified.

# DSL OF HTML5 TAGS

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

And notes, these DSL code has `sub (&) { ... }` prototype of perl,
But empty elements does not have this prototype.
So you could not passed CodeRef block to DSL of empty element. Be carefully.

# LICENSE

Copyright (C) OKAMURA Naoki a.k.a nyarla.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

OKAMURA Naoki a.k.a nyarla <nyarla@cpan.org>
