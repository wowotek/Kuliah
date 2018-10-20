import pyDes
import hashlib


data = b"Nama Saya Erlangga Ibrahim dengan nim 672017282"
k = pyDes.des(b"KeySayaX", pyDes.CBC, b"\0\0\0\0\0\0\0\0", pad=None, padmode=pyDes.PAD_PKCS5)
d = k.encrypt(data)
print("Contoh Enkripsi DES")
print("Encrypted:", d)
print("Decrypted:", k.decrypt(d))
assert k.decrypt(d) == data
