STARTDATE=$(date)

echo "$STARTDATE, [$TARGET_NAME] running"

cd `dirname $TARGET_SCRIPT` 

$TARGET_SCRIPT $TARGET_OPTIONS &> /cron/output

EXITCODE=$?
ENDDATE=$(date)

echo "$ENDDATE, [$TARGET_NAME] exited, $EXITCODE"

if [ ! -z "${NOTIFY_TO}" ];
then
	echo "To: $NOTIFY_TO" > /cron/mail
	echo "From: $NOTIFY_FROM" >> /cron/mail
	echo "Subject: Cron job \"$TARGET_NAME\": $EXITCODE" >> /cron/mail
	echo "" >> /cron/mail

	echo "Start: $STARTDATE" >> /cron/mail
	echo "End: $ENDDATE" >> /cron/mail
	echo "Job name: $TARGET_NAME" >> /cron/mail
	echo "Exit code: $EXITCODE" >> /cron/mail

	echo "---" >> /cron/mail

	cat /cron/output >> /cron/mail

	ssmtp $NOTIFY_TO < /cron/mail 
fi

