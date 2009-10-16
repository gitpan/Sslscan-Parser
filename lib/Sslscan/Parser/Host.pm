# $Id: Host.pm 18 2008-05-05 23:55:18Z jabra $
package Sslscan::Parser::Host;
{
    our $VERSION = '0.01';
    $VERSION = eval $VERSION;

    use Object::InsideOut;

    my @ip : Field : Arg(ip) : Get(ip);
    my @ports : Field : All(ports) : Type(List(Sslscan::Parser::Host::Port));

    sub get_port {
        my ( $self, $port ) = @_;
        my @ports = grep( $_->port eq $port, @{ $self->ports } );
        return $ports[0];
    }

    sub get_all_ports {
        my ($self) = @_;
        my @ports = @{ $self->ports };
        return @ports;
    }
}
1;
