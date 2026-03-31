#!/bin/bash

# Update packages
yum update -y

# Install PostgreSQL server
amazon-linux-extras enable postgresql14
yum install -y postgresql-server postgresql-contrib

# Initialize database
postgresql-setup initdb

# Start and enable PostgreSQL
systemctl start postgresql
systemctl enable postgresql

#create a test user and database
sudo -u postgres psql -c "CREATE USER techcorp WITH PASSWORD 'Tech1234';"
sudo -u postgres psql -c "CREATE DATABASE techcorp_db OWNER techcorp;"