

setvar()
{
	local varname=$1 varvalue=$2
	eval $varname='$(echo "$varvalue" | tr a-z n-za-m)'
}

setvar var "foobar"
echo $var
setvar var "$var"
echo $var
