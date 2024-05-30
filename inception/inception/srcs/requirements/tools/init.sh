#!/bin/sh


echo "Creating volumes : "

# creation /home/${USER}/data

target_dir="/home/${USER}/data"

# Check if the directory already exists
if [ ! -d "$target_dir" ]; then
  echo "Creating directory '$target_dir'..."
  mkdir "$target_dir"
  if [ $? -eq 0 ]; then
    echo "Directory created successfully!"
  else
    echo "Error! Directory creation failed (check exit code: '$?')"
  fi
else
  echo "Directory '$target_dir' already exists. Skipping creation."
fi

cd /home/${USER}/data


# creation /home/${USER}/data/db

target_dir="/home/${USER}/data/db/"

# Check if the directory already exists
if [ ! -d "$target_dir" ]; then
  echo "Creating directory '$target_dir'..."
  mkdir "$target_dir"
  if [ $? -eq 0 ]; then
    echo "Directory created successfully!"
  else
    echo "Error! Directory creation failed (check exit code: '$?')"
  fi
else
  echo "Directory '$target_dir' already exists. Skipping creation."
fi


# creation /home/${USER}/wp

target_dir="/home/${USER}/data/wp"

# Check if the directory already exists
if [ ! -d "$target_dir" ]; then
  echo "Creating directory '$target_dir'..."
  mkdir "$target_dir"
  if [ $? -eq 0 ]; then
    echo "Directory created successfully!"
  else
    echo "Error! Directory creation failed (check exit code: '$?')"
  fi
else
  echo "Directory '$target_dir' already exists. Skipping creation."
fi