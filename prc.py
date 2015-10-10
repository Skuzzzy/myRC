__author__ = 'dan'

import os
import json
import shutil

# Verify program is being run with sudo privileges
if os.getuid() != 0:
    print "Checking your privileges"
    raise Exception("needs sudo")

data = {}
filename = "manifest.json"
try:
    print "Loading {}".format(filename)
    with open(filename) as manifest:
        data = json.load(manifest)
except IOError:
    raise Exception("manifest.json missing")

# Create important directories
grc_dir = os.path.dirname(os.path.abspath(__file__))

# Create relavant directories
dotfiles_dir = os.path.join(grc_dir, 'dotfiles')
dotfolders_dir = os.path.join(grc_dir, 'dotfolders')

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

