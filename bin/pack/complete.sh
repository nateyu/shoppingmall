#collect pictures from raw location
chmod +x /var/tmp/shoppingmall/scripts_$1/collectImages.sh
./var/tmp/shoppingmall/scripts_$1/collectImages.sh

cd /var/tmp/shoppingmall/mall_$1
tar czf $2 .

