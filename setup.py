from subprocess import call
add_ppa_call = ["sudo add-apt-repository", "--yes"]
ppas = []
add_ppa_call.extend(ppas)
call(add_ppa_call)
call(["sudo apt-get update"])
install_packages_call = ["sudo apt-get install", "--assume-yes"]
packages = []
install_packages_call.extend(packages)
call(install_packages_call)
