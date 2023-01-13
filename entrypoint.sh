echo "$TARGET_CRON /cron/runner.sh" > /etc/crontabs/root

cat /etc/crontabs/root

if [ ! -z "${NOTIFY_TO}" ];
then

	echo "FromLineOverride=YES" > /etc/ssmtp/ssmtp.conf
	echo "root=$NOTIFY_FROM" >> /etc/ssmtp/ssmtp.conf
	echo "mailhub=$NOTIFY_HOST" >> /etc/ssmtp/ssmtp.conf
	echo "AuthUser=$NOTIFY_USER" >> /etc/ssmtp/ssmtp.conf
	echo "AuthPass=$NOTIFY_PASS" >> /etc/ssmtp/ssmtp.conf
	echo "UseSTARTTLS=$NOTIFY_STARTTLS" >> /etc/ssmtp/ssmtp.conf

	echo "Sending notifications to $NOTIFY_TO"
fi

/usr/sbin/crond -f