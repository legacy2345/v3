#!/bin/sh -e
#
# @file autogen.sh
# @brief Script to prepare the Legacy 2345 project build environment from a SCM
# checkout.
#
# Copyright 2011, 2012 Stephen M. Webb  <stephen.webb@bregmasoft.ca>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
blddir=$(pwd)
srcdir=$(dirname $0)
if [ -z "$srcdir" ]; then
  srcdir="$blddir"
fi

cd "$srcdir"
autoreconf -i -f -v

cd "$blddir"
if [ -z "$NOCONFIGURE" ]; then
  "$srcdir/configure" "$@"
fi
