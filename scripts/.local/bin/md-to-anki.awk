BEGIN { RS = "##" ; FS = "\n" }

{
	for(i=2;i<=NF-1;i++)
	      print $1, $i
}
