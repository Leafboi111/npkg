#!/bin/bash

Copyright (C) 2023 Leafboi

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

function install {
    cd pkgs
    read -p "Add git repository URL: " pkglink
    git clone $pkglink
    cd ..
}

function execute {
    read -p "Package to execute: " pkgrun
    bash pkgs/$pkgrun/main.sh
}

function search {
    read -p "Package to search:" pkgls
    grep -i $pkgls src.txt
}

function remove {
    read -p "Package to remove: " pkgrun
    rm -rf pkgs/$pkgrun
}

function main {
    read -p "Install, execute, search, or remove package [i/e/s/r]: " sq

    case $sq in
        [iI] ) install;;
            #break;;
        [eE] ) execute;;
            #break;;
        [sS] ) search;;
            #break;;
        [rR] ) remove;;
            #break;;
        * ) break
    esac
}

chmod 777 -R *
while true
do
  main
done
