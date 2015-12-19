from subprocess import call
import json

data = {}
filename = "package_manifest.json"
try:
    print "Loading {}".format(filename)
    with open(filename) as manifest:
        data = json.load(manifest)
except IOError:
    raise Exception("{} missing".format(filename))

add_ppa_call = ["sudo", "add-apt-repository", "--yes"]
ppas = data["ppa"]
add_ppa_call.extend(ppas)
call(add_ppa_call)
call(["sudo", "apt-get", "update"])
install_packages_call = ["sudo", "apt-get", "install", "--assume-yes"]
packages = data["package"]
install_packages_call.extend(packages)
print str(install_packages_call)
call(install_packages_call)
