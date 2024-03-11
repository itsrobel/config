if [ -d "/sys/class/power_supply" ]; then
	COMPUTER_TYPE="Desktop"
else
	COMPUTER_TYPE="Laptop"
fi

echo $COMPUTER_TYPE
