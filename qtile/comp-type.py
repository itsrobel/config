import subprocess


result = subprocess.run(
    ["./comp-type.sh"], stdout=subprocess.PIPE, shell=True
).stdout.decode("utf-8")
print(result)

if result == "Desktop\n":
    print("No battery")
if result == "Laptop\n":
    print("Battery")
