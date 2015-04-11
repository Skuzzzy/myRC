import shutil
import os
lines = [line.rstrip('\n') for line in open("MANIFEST")]
for fileName in lines:
	print "Grabbing " + fileName
	#print os.path.expanduser("~")+"/"+fileName,
	if(os.path.exists(os.path.expanduser("~")+"/"+fileName)):
		if(fileName.endswith("/")): # File is a folder
			shutil.rmtree(fileName)
			shutil.copytree(os.path.expanduser("~")+"/"+fileName,fileName)
		else: # File is not a folder
			shutil.copy2(os.path.expanduser("~")+"/"+fileName,fileName)
	else:
		print "Could not find " + fileName
print "Complete"
