def hitungMolar():
    g = float(input("Berapa gram zat terlarut (g) : "))
    mr = float(input("Berapa Massa Molekul (Mr)   : "))
    ml = float(input("Berapa volume Larutan (Ml)  : "))
    mol = (g/mr) * (1000/ml)
    print("Molaritas : {} mol".format(str(mol)))


def hitungMolal():
    g = float(input("Berapa gram zat terlarut (g)  : "))
    mm = float(input("Berapa massa molar zat (Mm)  : "))
    p = float(input("Massa zat Pelarut (P)         : "))
    m = (g/mm) * (1000/p)
    print("Molalitas : {} m".format(str(m)))



