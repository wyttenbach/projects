#!/usr/bin/perl
use feature qw(say);
use Data::Dumper;
use File::Basename;
use JSON;
use MongoDB;
use MongoDB::OID;

my $client = MongoDB::MongoClient->new(host => 'ddhnr3v12.decare.com');
my $db = $client->get_database( 'nucleus' );
my $coll = $db->get_collection( 'GroovyScriptResult' );
#say $coll->count();

my $shortname;
my $name;
my $version;
my $database;
my $client;
my $server;

my $vars;

# Use runId to obtain values
# my $runId 
# my $versions = $db->run_command([distinct => GroovyScriptResult, key => version, query => {runId => $runId}]);
# my $databases = $db->run_command([distinct => GroovyScriptResult, key => database, query => {runId => $runId}]);
# my $clients = $db->run_command([distinct => GroovyScriptResult, key => client, query => {runId => $runId}]);
# my $servers = $db->run_command([distinct => GroovyScriptResult, key => server, query => {runId => $runId}]);
# $version = $versions->{ values }[0];
# $database = $databases->{ values }[0];
# $client = $clients->{ values }[0];
# $server = $servers->{ values }[0];

if ($ARGV[0] =~ /.dat/) {
    # Obtain values from filename
    @parts = split('-', $ARGV[0]);
    
    $version = $parts[0];
    $database = $parts[1];
    $name = basename($parts[2], ".dat");
} else {
    $version = $ARGV[0] || die ("Need version");
    $database = $ARGV[1] || die ("Need database");
    $name = $ARGV[2] || die ("Need name");
	# $client = 
	# $server = 
}

my $vars = {
    version => $version,
    database => $database,
    name => qr/$name/i,
#    client => $client,
#    server => $server,
};
say Dumper($vars);

my $id;
# for my $value (values %{$vars}) {
#     if (defined($id)) {
#         $id = sprintf "%s-%s", $id, $value;
#     } else {
#         $id = $value;
#     }
# }
$id = sprintf "%s-%s-%s", $version, $database, $name;
#say $id;

say $coll->count();

my $series = $coll->find($vars)->fields({'_id' => 0})->sort( { runId => 1 } );
$series->count > 0 or die "No results";

my $file = $id . ".dat";
open my $fhTemp, "> $file" or die "Can't create $file!\n";

sub DateTime::TO_JSON {
    { "".shift }
}

printf $fhTemp "[\n";
while (my $doc = $series->next) {
    print $fhTemp to_json($doc, { convert_blessed => 1});
    if ($series->has_next) {
        print $fhTemp ",";
    }
    print $fhTemp "\n";
}
printf $fhTemp "]\n";

close $fhTemp;
system "wc -l $file";
system "bash -c \"graph $file\"";
