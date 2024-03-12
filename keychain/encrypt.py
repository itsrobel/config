from cryptography.fernet import Fernet
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
import os
import base64
from keyhelper import KeyTable
import sys

if len(sys.argv) == 1:
    table = KeyTable("keychain")
else:
    table = KeyTable(sys.argv[1])

if table.is_table() == False:
    table.create_table()


name = input("Enter name: ")
key = input("Enter key: ").encode()
password = input("Enter password: ").encode()
salt = base64.b64encode(os.urandom(16))

kdf = PBKDF2HMAC(algorithm=hashes.SHA256(), length=32, salt=salt, iterations=390000)

hash = base64.urlsafe_b64encode(kdf.derive(password))
fernet = Fernet(hash)
encrypt = fernet.encrypt(key)


encrypt = encrypt.decode()
salt = salt.decode()

table.write_table(name, encrypt, salt)
