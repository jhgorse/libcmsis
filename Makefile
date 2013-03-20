##
# Copyright (c) 2009 Piotr Esden-Tempski <piotr@esden.net>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
##

arch_prefix?=arm-none-eabi
compiler_prefix?=${arch_prefix}-
prefix?=/usr/local
install_dir?=${prefix}/${arch_prefix}

all:
	make -C src all
	
clean:
	make -C src clean

install:
	install -d ${install_dir}/include/cmsis
	install -d ${install_dir}/shared/doc/libcmsis/startup
	install -d ${install_dir}/shared/doc/libcmsis/startup/iar
	install -d ${install_dir}/shared/doc/libcmsis/startup/arm
	install -d ${install_dir}/shared/doc/libcmsis/startup/gcc
	install -C include/cmsis/*.h ${install_dir}/include/cmsis
	install -C src/libcmsis.a ${install_dir}/lib/libcmsis.a
	install -C doc/startup/iar/* ${install_dir}/shared/doc/libcmsis/startup/iar
	install -C doc/startup/arm/* ${install_dir}/shared/doc/libcmsis/startup/arm
	install -C doc/startup/gcc/* ${install_dir}/shared/doc/libcmsis/startup/gcc
