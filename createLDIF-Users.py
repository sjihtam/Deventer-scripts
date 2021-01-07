#Create LDIF Users

dn = ",ou=Users,dc=deventer,dc=local"
gid = 501
basehomedir = "/mnt/Homefolders/"
user = 1

type = input("Medewerker (1) of Studenten (2) ?: ")
amount = input("Hoeveel users?: ")
uid = int(input("Start UID?: "))

if str(type) != "1" and str(type) != "2":
    print("Selecteer Medewerker of Studenten")
    exit()

while user < (int(amount) + 1):
    if type == "1":
        type = "Medewerker"
        fulldn = "dn: cn=" + type + "_" + str(user) + "," + "ou=" + type.lower() + "s" + dn
    elif type == "2":
        type = "Studenten"
        fulldn = "dn: cn=" + type + "_" + str(user) + "," + "ou=" + type.lower() + dn

    f = open("users.ldif", "a")
    f.write(fulldn + "\n"
            "cn: " + type + "_" + str(user) + "\n"
            "gidnumber: 501" + "\n"
            "givenname: " + type + "\n"
            "homedirectory: /mnt/Homefolders/." + type.lower() + str(user) + "\n"
            "objectclass: inetOrgPerson" + "\n"
            "objectclass: posixAccount" + "\n"
            "objectclass: top" + "\n"
            "sn: 1" + "\n"
            "uid: " + type.lower() + str(user) + "\n"
            "uidnumber: " + str(uid) + "\n"
            "userpassword: {MD5}CY9rzUYh03PK3k6DJie09g==" + "\n" + "\n")
    f.close()
    uid += 1
    user += 1

