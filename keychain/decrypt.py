from cryptography.fernet import Fernet
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
import base64
import sys
from keyhelper import KeyTable
from keyhelper import check_directory


def get_key(table, name, password):
    entry = table.get_row(name)
    key = entry["key"]
    salt = entry["salt"]
    if salt == "not found":
        print("Name not found")
        exit()
    # covert to bytes
    key = key.encode()
    salt = salt.encode()

    kdf = PBKDF2HMAC(algorithm=hashes.SHA256(), length=32, salt=salt, iterations=390000)
    fernet = Fernet(base64.urlsafe_b64encode(kdf.derive(password)))

    decrypt = fernet.decrypt(key)
    return decrypt.decode()


def get_all_keys():
    if len(sys.argv) == 1:
        table = KeyTable("keychain")
    else:
        table = KeyTable(sys.argv[1])

    if table.is_table() == False:
        print("Table does not exist")
        exit()

    password = input("Enter password: ").encode()
    for entry in table.read_table():
        print(entry["name"])
        key = get_key(table, entry["name"], password)
        key_file = open(
            f"%s/%s.txt" % (check_directory("decrypted"), entry["name"]), "w"
        )
        key_file.write(key)
        key_file.close()


if __name__ == "__main__":
    get_all_keys()
