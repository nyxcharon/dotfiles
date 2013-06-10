
my $file = 'cloud';
open my $info, $file or die "Could not open $file: $!";
while( my $line = <$info>) 
 {   
    $output = `ldapsearch -xLLL automountKey=$line`;
    print $output;
    
}

close $info;
