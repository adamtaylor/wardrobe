package Wardrobe::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';
use Data::Dumper;
use Text::CSV_XS;

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

Wardrobe::Controller::Root - Root Controller for Wardrobe

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
}

=head2 upload

Method for handling CSV file upload.

=cut

sub upload :Local {
    my ( $self, $c ) = @_;
    my $upload = $c->req->upload('file');
    
    my @rows;
    my $csv = Text::CSV_XS->new ({ binary => 1 }) or
        die "Cannot use CSV: ".Text::CSV->error_diag ();
    open my $fh, "<:encoding(utf8)", $upload->tempname or die "$upload->tempname: $!";
    while (my $row = $csv->getline ($fh)) {
        push @rows, $row;
    }
    $csv->eof or $csv->error_diag ();
    close $fh;
    
    my $category_rs = $c->model('WardrobeDB::Categories');
    my $clothes_rs = $c->model('WardrobeDB::Clothes');
    
    foreach my $row (@rows) {
        ## todo -> that doesn't work
        unless ($_ == 0) {
            my $category = $category_rs->create( { name =>  $row->[1] } );
            my $clothing = $clothes_rs->create( { name =>  $row->[0] } );
            $clothing->add_to_category( 'id', $clothing->id );
        }
    }
    
    $c->stash( template => 'index.tt' );
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Adam Taylor

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
