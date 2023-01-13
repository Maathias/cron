STARTDATE=$(date)

echo "$STARTDATE, Running $TARGET_NAME"

$TARGET_SCRIPT $TARGET_OPTIONS &> /cron/output

EXITCODE=$?

ENDDATE=$(date)

echo "To: $NOTIFY_TO" > /cron/mail
echo "From: $NOTIFY_FROM" >> /cron/mail
echo "Subject: Cron job \"$TARGET_NAME\": [$EXITCODE]" >> /cron/mail
echo "" >> /cron/mail

echo "Start: $STARTDATE" >> /cron/mail
echo "End: $ENDDATE" >> /cron/mail
echo "Job name: $TARGET_NAME" >> /cron/mail
echo "Exit code: $EXITCODE" >> /cron/mail

echo "---" >> /cron/mail

cat /cron/output >> /cron/mail

ssmtp $NOTIFY_TO < /cron/mail 