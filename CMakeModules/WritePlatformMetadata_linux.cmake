#
#  This program source code file is part of KICAD, a free EDA CAD application.
#
#  Copyright (C) 2019 Ian McInerney <Ian.S.McInerney@ieee.org>
#  Copyright (C) 2019 KiCad Developers, see AUTHORS.txt for contributors.
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 2
#  of the License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, you may find one here:
#  http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
#  or you may search the http://www.gnu.org website for the version 2 license,
#  or you may write to the Free Software Foundation, Inc.,
#  51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
#

# This file will configure the linux appdata.xml file to include the version
# and build date.

message( STATUS "Creating linux metadata" )

# Create the KiCad version strings
set( SRC_PATH ${PROJECT_SOURCE_DIR} )
include( ${CMAKE_MODULE_PATH}/KiCadVersion.cmake )
include( ${CMAKE_MODULE_PATH}/KiCadFullVersion.cmake )

# Create the date of the configure
string( TIMESTAMP KICAD_CONFIG_TIMESTAMP "%Y-%m-%d" )

# Configure the KiCad appdata file
configure_file( ${PROJECT_SOURCE_DIR}/resources/linux/appdata/kicad.appdata.xml.in
                ${PROJECT_BINARY_DIR}/resources/linux/appdata/kicad.appdata.xml
                @ONLY )

# Ensure the file was configured successfully
if( NOT EXISTS ${PROJECT_BINARY_DIR}/resources/linux/appdata/kicad.appdata.xml )
    message( FATAL_ERROR "Configuration failed to write file kicad.appdata.xml." )
endif()
