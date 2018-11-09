# cut_col
Cut column using column name

~~~~
function cut_col() {
    fname=${1}
    cols=${2-$(head -1 $fname | tr -s "," "|")}
    delimiter=${3-","}
    cut -d"${delimiter}" -f $(head -1 ${fname} | tr "${delimiter}" '\n' | egrep -n "${cols}" | cut -d ":" -f 1 | tr '\n' "," | sed 's/,$//') ${fname}
}

export -f cut_col
~~~~

### Usage:- 

cat file_name.csv
~~~~
name,math,physics,chemistry
ram,10,20,30
dave,11,21,31
deepa,12,22,32
sam,13,23,33
dude,14,24,34
~~~~

cut_col filename.csv "name|chemistry"
~~~~
name,chemistry
ram,30
dave,31
deepa,32
sam,33
dude,34
~~~~

