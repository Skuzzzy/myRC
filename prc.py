import os
import json
import shutil
import sys

config_name = "default"
if len(sys.argv) > 1:
    config_name = sys.argv[1]
print "Grabbing \"{}\" configuration".format(config_name)

data = {}
filename = "manifest.json"
try:
    print "Loading {}".format(filename)
    with open(filename) as manifest:
        data = json.load(manifest)
except IOError:
    raise Exception("manifest.json missing")

# Create important directories
prc_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "conf", config_name)

# Create relavant directories
dotfiles_dir = os.path.join(prc_dir, 'dotfiles')
dotfolders_dir = os.path.join(prc_dir, 'dotfolders')

if not os.path.exists(dotfiles_dir):
    print "Creating dotfiles directory"
    os.makedirs(dotfiles_dir)

if not os.path.exists(dotfolders_dir):
    print "Creating dotfolders directory"
    os.makedirs(dotfolders_dir)

# Get current user home directory
home = os.path.expanduser("~")
print "User home directory is {}".format(home)

err = []

# Copy all files
for file in data["files"]:
    try:
        target_path = os.path.join(home, file)
        full_file_path = os.path.join(dotfiles_dir, os.path.basename(target_path))
        print "Copying file {} -> {}".format(full_file_path, target_path)
        shutil.copyfile(full_file_path, target_path)
        print "\tSuccess!"
    except Exception as e:
        print "\t{}".format(e)
        err.append(full_file_path)
        print "\tERROR: Failed to copy file {} -> {}".format(full_file_path, target_path)

# Copy all folders
for folder in data["folders"]:
    try:
        target_path = os.path.join(home, folder)
        full_folder_path = os.path.join(dotfolders_dir, folder)
        if os.path.exists(target_path):
            shutil.rmtree(target_path)
        print "Copying folder {} -> {}".format(full_folder_path, target_path)
        shutil.copytree(full_folder_path, target_path)
        print "\tSuccess!"
    except Exception as e:
        print "\t{}".format(e)
        err.append(full_folder_path)
        print "\tERROR: Failed to copy folder {} -> {}".format(full_folder_path, target_path)

print "Completed"
print "Result: "
if len(err) != 0:
    for each in err:
        print "\tError on file/folder {}".format(each)
else:
    print "\tSuccess! No errors"

