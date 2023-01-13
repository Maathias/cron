curl https://www.cloudflare.com/ips-v4 > cf_ips;
echo "" >> cf_ips;
curl https://www.cloudflare.com/ips-v6 >> cf_ips;
echo "" >> cf_ips;

sed 's/.*/set_real_ip_from &;/g' cf_ips > cf_real_ip;

echo "" >> cf_real_ip;
echo "real_ip_header CF-Connecting-IP;" >> cf_real_ip;