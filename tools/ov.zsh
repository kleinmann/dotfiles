[[ -x `which ov` ]] &> /dev/null && alias less=ov
[[ -x `which ov` ]] &> /dev/null && export PAGER="ov -F"
[[ -x `which ov` ]] &> /dev/null && export BAT_PAGER="ov -F -H3"
[[ -x `which ov` ]] &> /dev/null && export PSQL_PAGER='ov -F -C -d "|" -H1 --column-rainbow'
