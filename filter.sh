cat converted_names.txt | egrep "^E" | egrep -v ".+<" | sed 's/\.[0-9]//g' | awk '{
  print substr($1, 1, 15), substr($2, 1, 15), $3
}' | rev | uniq -f1 | rev | sort -n | awk '{
  if($1 != $2){
    print $1, $2, $3
  }else{
    print $1
  }
}' | sort | uniq | sort -rk3,3
