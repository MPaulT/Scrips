#!/bin/bash
# the clock will show the date time in binnery


# YL8 YL4 ML8 ML4 DL8 DL3 HL8 HL4 NL8 NL4 SL8 SL4
# YL7 YL3 ML7 ML3 DL7 DL2 HL7 HL3 NL7 NL3 SL7 SL3
# YL6 YL2 ML6 ML2 DL6 DL2 HL6 HL2 NL6 NL2 SL6 SL2
# YL5 YL1 ML5 ML1 DL5 DL1 HL5 HL1 NL5 NL1 SL5 SL1

while :
do
	YEARs=`date +%g`
	MOUTHs=`date +%m`
	DAYs=`date +%d`
	HOURs=`date +%H`
	MINs=`date +%M`
	SECs=`date +%S`

	YEARm=`expr $YEARs + 256`
	MOUTHm=`expr $MOUTHs + 256`
	DAYm=`expr $DAYs + 256`
	HOURm=`expr $HOURs + 256`
	MINm=`expr $MINs + 256`
	SECm=`expr $SECs + 256`

	YEARe=`echo "obase=2; $YEARm" | bc`
	MOUTHe=`echo "obase=2; $MOUTHm" | bc`
	DAYe=`echo "obase=2; $DAYm" | bc`
	HOURe=`echo "obase=2; $HOURm" | bc`
	MINe=`echo "obase=2; $MINm" | bc`
	SECe=`echo "obase=2; $SECm" | bc`

# THIS IS FOR THE YEAR
	# FIGURE OUT IF YEARS 128 BIT IS ON
	if [ ${YEARe:1:1} == 1 ]
		then
			YL8=1
		else
			YL8=0
	fi
	# FIGURE OUT IF YEARS 64 BIT IS ON
	if [ ${YEARe:2:1} == 1 ]
		then
			YL7=1
		else
			YL7=0
	fi
	# FIGURE OUT IF YEARS 32 BIT IS ON
	if [ ${YEARe:3:1} == 1 ]
		then
			YL6=1
		else
			YL6=0
	fi
	# FIGURE OUT IF YEARS 16 BIT IS ON
	if [ ${YEARe:4:1} == 1 ]
		then
			YL5=1
		else
			YL5=0
	fi
	# FIGURE OUT IF YEARS 8 BIT IS ON
	if [ ${YEARe:5:1} == 1 ]
		then
			YL4=1
		else
			YL4=0
	fi
	# FIGURE OUT IF YEARS 4 BIT IS ON
	if [ ${YEARe:6:1} == 1 ]
		then
			YL3=1
		else
			YL3=0
	fi
	# FIGURE OUT IF YEARS 2 BIT IS ON
	if [ ${YEARe:7:1} == 1 ]
		then
			YL2=1
		else
			YL2=0
	fi
	# FIGURE OUT IF YEARS 1 BIT IS ON
	if [ ${YEARe:8:1} == 1 ]
		then
			YL1=1
		else
			YL1=0
	fi

# THIS IS FOR THE MOUTH
	# FIGURE OUT IF MOUTH 128 BIT IS ON
	if [ ${MOUTHe:1:1} == 1 ]
		then
			ML8=1
		else
			ML8=0
	fi
	# FIGURE OUT IF MOUTH 64 BIT IS ON
	if [ ${MOUTHe:2:1} == 1 ]
		then
			ML7=1
		else
			ML7=0
	fi
	# FIGURE OUT IF MOUTH 32 BIT IS ON
	if [ ${MOUTHe:3:1} == 1 ]
		then
			ML6=1
		else
			ML6=0
	fi
	# FIGURE OUT IF MOUTH 16 BIT IS ON
	if [ ${MOUTHe:4:1} == 1 ]
		then
			ML5=1
		else
			ML5=0
	fi
	# FIGURE OUT IF MOUTH 8 BIT IS ON
	if [ ${MOUTHe:5:1} == 1 ]
		then
			ML4=1
		else
			ML4=0
	fi
	# FIGURE OUT IF MOUTH 4 BIT IS ON
	if [ ${MOUTHe:6:1} == 1 ]
		then
			ML3=1
		else
			ML3=0
	fi
	# FIGURE OUT IF MOUTH 2 BIT IS ON
	if [ ${MOUTHe:7:1} == 1 ]
		then
			ML2=1
		else
			ML2=0
	fi
	# FIGURE OUT IF MOUTH 1 BIT IS ON
	if [ ${MOUTHe:8:1} == 1 ]
		then
			ML1=1
		else
			ML1=0
	fi
# THIS IS FOR THE DAY
	# FIGURE OUT IF DAY 128 BIT IS ON
	if [ ${DAYe:1:1} == 1 ]
		then
			DL8=1
		else
			DL8=0
	fi
	# FIGURE OUT IF DAY 64 BIT IS ON
	if [ ${DAYe:2:1} == 1 ]
		then
			DL7=1
		else
			DL7=0
	fi
	# FIGURE OUT IF DAY 32 BIT IS ON
	if [ ${DAYe:3:1} == 1 ]
		then
			DL6=1
		else
			DL6=0
	fi
	# FIGURE OUT IF DAY 16 BIT IS ON
	if [ ${DAYe:4:1} == 1 ]
		then
			DL5=1
		else
			DL5=0
	fi
	# FIGURE OUT IF DAY 8 BIT IS ON
	if [ ${DAYe:5:1} == 1 ]
		then
			DL4=1
		else
			DL4=0
	fi
	# FIGURE OUT IF DAY 4 BIT IS ON
	if [ ${DAYe:6:1} == 1 ]
		then
			DL3=1
		else
			DL3=0
	fi
	# FIGURE OUT IF DAY 2 BIT IS ON
	if [ ${DAYe:7:1} == 1 ]
		then
			DL2=1
		else
			DL2=0
	fi
	# FIGURE OUT IF DAY 1 BIT IS ON
	if [ ${DAYe:8:1} == 1 ]
		then
			DL1=1
		else
			DL1=0
	fi
# THIS IS FOR THE HOUR
	# FIGURE OUT IF HOUR 128 BIT IS ON
	if [ ${HOURe:1:1} == 1 ]
		then
			HL8=1
		else
			HL8=0
	fi
	# FIGURE OUT IF HOUR 64 BIT IS ON
	if [ ${HOURe:2:1} == 1 ]
		then
			HL7=1
		else
			HL7=0
	fi
	# FIGURE OUT IF HOUR 32 BIT IS ON
	if [ ${HOURe:3:1} == 1 ]
		then
			HL6=1
		else
			HL6=0
	fi
	# FIGURE OUT IF HOUR 16 BIT IS ON
	if [ ${HOURe:4:1} == 1 ]
		then
			HL5=1
		else
			HL5=0
	fi
	# FIGURE OUT IF HOUR 8 BIT IS ON
	if [ ${HOURe:5:1} == 1 ]
		then
			HL4=1
		else
			HL4=0
	fi
	# FIGURE OUT IF HOUR 4 BIT IS ON
	if [ ${HOURe:6:1} == 1 ]
		then
			HL3=1
		else
			HL3=0
	fi
	# FIGURE OUT IF HOUR 2 BIT IS ON
	if [ ${HOURe:7:1} == 1 ]
		then
			HL2=1
		else
			HL2=0
	fi
	# FIGURE OUT IF HOUR 1 BIT IS ON
	if [ ${HOURe:8:1} == 1 ]
		then
			HL1=1
		else
			HL1=0
	fi
# THIS IS FOR THE MIN
	# FIGURE OUT IF MIN 128 BIT IS ON
	if [ ${MINe:1:1} == 1 ]
		then
			NL8=1
		else
			NL8=0
	fi
	# FIGURE OUT IF MIN 64 BIT IS ON
	if [ ${MINe:2:1} == 1 ]
		then
			NL7=1
		else
			NL7=0
	fi
	# FIGURE OUT IF MIN 32 BIT IS ON
	if [ ${MINe:3:1} == 1 ]
		then
			NL6=1
		else
			NL6=0
	fi
	# FIGURE OUT IF MIN 16 BIT IS ON
	if [ ${MINe:4:1} == 1 ]
		then
			NL5=1
		else
			NL5=0
	fi
	# FIGURE OUT IF MIN 8 BIT IS ON
	if [ ${MINe:5:1} == 1 ]
		then
			NL4=1
		else
			NL4=0
	fi
	# FIGURE OUT IF MIN 4 BIT IS ON
	if [ ${MINe:6:1} == 1 ]
		then
			NL3=1
		else
			NL3=0
	fi
	# FIGURE OUT IF MIN 2 BIT IS ON
	if [ ${MINe:7:1} == 1 ]
		then
			NL2=1
		else
			NL2=0
	fi
	# FIGURE OUT IF MIN 1 BIT IS ON
	if [ ${MINe:8:1} == 1 ]
		then
			NL1=1
		else
			NL1=0
	fi
# THIS IS FOR THE SEC
	# FIGURE OUT IF SEC 128 BIT IS ON
	if [ ${SECe:1:1} == 1 ]
		then
			SL8=1
		else
			SL8=0
	fi
	# FIGURE OUT IF SEC 64 BIT IS ON
	if [ ${SECe:2:1} == 1 ]
		then
			SL7=1
		else
			SL7=0
	fi
	# FIGURE OUT IF SEC 32 BIT IS ON
	if [ ${SECe:3:1} == 1 ]
		then
			SL6=1
		else
			SL6=0
	fi
	# FIGURE OUT IF SEC 16 BIT IS ON
	if [ ${SECe:4:1} == 1 ]
		then
			SL5=1
		else
			SL5=0
	fi
	# FIGURE OUT IF SEC 8 BIT IS ON
	if [ ${SECe:5:1} == 1 ]
		then
			SL4=1
		else
			SL4=0
	fi
	# FIGURE OUT IF SEC 4 BIT IS ON
	if [ ${SECe:6:1} == 1 ]
		then
			SL3=1
		else
			SL3=0
	fi
	# FIGURE OUT IF SEC 2 BIT IS ON
	if [ ${SECe:7:1} == 1 ]
		then
			SL2=1
		else
			SL2=0
	fi
	# FIGURE OUT IF SEC 1 BIT IS ON
	if [ ${SECe:8:1} == 1 ]
		then
			SL1=1
		else
			SL1=0
	fi
clear
echo
echo "the the date time is $DAYs/$MOUTHs/$YEARs $HOURs:$MINs:$SECs"
echo
echo "the binary date time is ${DAYe:1:8}/${MOUTHe:1:8}/${YEARe:1:8} ${HOURe:1:8}:${MINe:1:8}:${SECe:1:8}"
echo
echo -e "\t|$DL8 $DL4| |$ML8 $ML4| |$YL8 $YL4| |$HL8 $HL4| |$NL8 $NL4| |$SL8 $SL4|"
echo -e "\t|$DL7 $DL3| |$ML7 $ML3| |$YL7 $YL3| |$HL7 $HL3| |$NL7 $NL3| |$SL7 $SL3|"
echo -e "\t|$DL6 $DL2| |$ML6 $ML2| |$YL6 $YL2| |$HL6 $HL2| |$NL6 $NL2| |$SL6 $SL2|"
echo -e "\t|$DL5 $DL1| |$ML5 $ML1| |$YL5 $YL1| |$HL5 $HL1| |$NL5 $NL1| |$SL5 $SL1|"
echo
echo -e "\t|128 8| |128 8| |128 8| |128 8| |128 8| |128 8|"
echo -e "\t| 64 4| | 64 4| | 64 4| | 64 4| | 64 4| | 64 4|"
echo -e "\t| 32 2| | 32 2| | 32 2| | 32 2| | 32 2| | 32 2|"
echo -e "\t| 16 1| | 16 1| | 16 1| | 16 1| | 16 1| | 16 1|"
echo
sleep 1
done
