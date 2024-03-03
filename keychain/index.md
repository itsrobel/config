---
id: index
aliases:
  - Python Password Encryption script
tags: []
---

# Python Password Encryption script

A python script that contains the hashing algro that will decode the Encrypted API Keys given the token

## Functions

- Program will be located in ~/config/keys
- Encrypted API Keys will be located in ~/config/keys/encrypted
  - The Encrypted keys will be in a database with its own salt
    - The "Database" being a csv file
    - probably using a cloud service
      - Probably a github private repo
- Program will export all keys into ~/config/keys/decrypted
- set the .gitignore to ignore ~/config/keys/decrypted
- set a fish alias of "getkeys"

### architecture

#### encrypt.py

- asks file name of database
- from then asks the user for the csv fields IE: NAME,KEY,SALT
- asks for the Password to encrypt with
- then encrypts and appends to database

#### decrypt.py

- asks for file name of database
- asks for name of service
- asks for password
- decrypts
- export as a return type or to file

#### csvreader.py

- Does all the of file management shit

### Things to think about

Since this repo is public there should probably a method to ensure no one can mess with the hash
stored in ~/config/keys/encrypted? Maybe just store it in a separate repo and call a specific version of it?

## Project Notes

Turns out python's standard `open()` and `os.open()` are no the same

`Fernet(arg n)` takes in a byte "string"
also requires the string to be base64 url safe
which means I need to use `string.encode(encoding)` where `encoding = "utf-8`
or some other encoding param check docs

This project is mildly more annoying than I thought it would be

https://stackoverflow.com/questions/44432945/generating-own-key-with-python-fernet

Once decoding is done the "plan text" which is really still byte UTF-8
then needs to be converted back to actual plan text
which is intuitively done with `decode()`

I need to replace with `os.urandom` with a key that is static
python will (obviously ) generate a new key each time its run

- [ ] Online database??? https://cloud.seatable.io/
  - probably use a csv?
- [ ]How am I supposed to save its API KEY THEN ?
