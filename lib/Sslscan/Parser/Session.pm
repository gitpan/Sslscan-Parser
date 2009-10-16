# $Id: Session.pm 18 2008-05-05 23:55:18Z jabra $
package Sslscan::Parser::Session;
{
    our $VERSION = '0.01';
    $VERSION = eval $VERSION;

    use Object::InsideOut;
    use XML::LibXML;
    use Sslscan::Parser::ScanDetails;

    my @title : Field : Arg(title) : All(title);
    my @web : Field : Arg(web) : All(web);
    my @version : Field : Arg(version) : All(version);
    my @scandetails : Field : Arg(scandetails) : Get(scandetails) :
        Type(Sslscan::Parser::ScanDetails);

    sub parse {
        my ( $self, $parser, $doc ) = @_;

        foreach my $Sslscanscan ( $doc->getElementsByTagName('document') ) {
            return Sslscan::Parser::Session->new(
                title   => $Sslscanscan->getAttribute('title'),
                version     => $Sslscanscan->getAttribute('version'),
                web     => $Sslscanscan->getAttribute('web'),
                scandetails => Sslscan::Parser::ScanDetails->parse( $parser, $doc ),
            );
        }
    }
}
1;
