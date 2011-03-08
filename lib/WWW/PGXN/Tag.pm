package WWW::PGXN::Tag;

use 5.8.1;
use strict;

our $VERSION = '0.10';

sub new {
    my ($class, $data) = @_;
    bless $data, $class;
}

sub name { shift->{tag} }

sub releases {
    +{ %{ shift->{releases} } }
}

__END__

=head1 Name

WWW::PGXN::Tag - Tag metadata fetched from PGXN

=head1 Synopsis

  my $pgxn = WWW::PGXN->new( url => 'http://api.pgxn.org/' );
  my $tag  = $pgxn->find_tag('unit testing');
  say $tag->name;

=head1 Description

This module represents PGXN tag metadata fetched from PGXN>. It is not
intended to be constructed directly, but via the L<WWW::PGXN/find_tag> method
of L<WWW::PGXN>.

=head1 Interface

=begin private

=head2 Constructor

=head3 C<new>

  my $tag = WWW::PGXN::Tag->new($data);

Construct a new WWW::PGXN::Tag object. The argument must be the data fetched.

=end private

=head2 Instance Accessors

=head3 C<name>

  my $name = $tag->name;
  $tag->name($name);

The name of the tag.

=head3 C<releases>

  my $releases = $tag->releases;

Returns a hash reference describing all of the distributions ever released
with the tag. The keys of are distribution names and the values are hash
references that may contain the following keys:

=over

=item C<stable>

=item C<testing>

=item C<unstable>

An array reference with the version numbers of all releases of the
distribution with the named release status, ordered from most to least recent.

=item C<stable_date>

=item C<testing_date>

=item C<unstable_date>

The date of the most recent release of the named release status. Represented
as a string in strict L<ISO-8601|http://en.wikipedia.org/wiki/ISO_8601> format
and in the UTC time zone. Available only from the PGXN API, not mirrors.

=item C<abstract>

A brief description of the distribution. Available only from the PGXN API, not
mirrors.

=back

=head1 See Also

=over

=item * L<WWW::PGXN>

The main class to communicate with a PGXN mirror or API server.

=back

=head1 Support

This module is stored in an open L<GitHub
repository|http://github.com/theory/www-pgxn/>. Feel free to fork and
contribute!

Please file bug reports via L<GitHub
Issues|http://github.com/theory/www-pgxn/issues/> or by sending mail to
L<bug-WWW-PGXN@rt.cpan.org|mailto:bug-WWW-PGXN@rt.cpan.org>.

=head1 Author

David E. Wheeler <david@justatheory.com>

=head1 Copyright and License

Copyright (c) 2011 David E. Wheeler. Some Rights Reserved.

This module is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
