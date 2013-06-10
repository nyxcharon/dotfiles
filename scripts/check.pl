
my $file = 'list.txt';
open my $info, $file or die "Could not open $file: $!";
while( my $line = <$info>) 
 {   
    $output = `ldapsearch -xLLL cn=$line`;
     print $output;
    
}

close $info;
