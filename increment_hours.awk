#Simple awk script which increments hours in mysql dump file in the table 'organizer_event'.


BEGIN {FS="'"}
/INSERT INTO `organizer_event/{
    #Number by which the hours should be incremented
    hours_added = 3
        for ( i = 1; i < NF; i++) {
            if ( i != 1)
                printf FS;
            if (match($i, "[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9][0-9]:[0-9][0-9]:[0-9][0-9]")){
                split($i, ar1, " ")
                    time = ar1[2]
                    split(time, ar2, ":")
                    hour = ar2[1] + hours_added
                    printf( ar1[1]" ")
                    printf("%02d",hour)
                    printf(":"ar2[2]":"ar2[3])  
            } else
                printf $i;
        }
    print "', 1);"; #Hardcoded adding the end with user id 1
next}
1


