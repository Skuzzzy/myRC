import shutil
import os
lines = [line.rstrip('\n') for line in open("MANIFEST")]
for fileName in lines:
	print "Putting " + fileName
	if(os.path.exists(fileName)):
		if(fileName.endswith("/")): #File is a folder
			shutil.copytree(fileName,os.path.expanduser("~")+"/"+fileName)
		else: 
			shutil.copy2(fileName,os.path.expanduser("~")+"/"+fileName)
	else:
		print "Could not find " + fileName
print "Complete"
