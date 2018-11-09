function cut_col() {
    fname=${1}
    cols=${2-$(head -1 $fname | tr -s "," "|")}
    delimiter=${3-","}
    cut -d"${delimiter}" -f $(head -1 ${fname} | tr "${delimiter}" '\n' | egrep -n "${cols}" | cut -d ":" -f 1 | tr '\n' "," | sed 's/,$//') ${fname}
}

export -f cut_col
