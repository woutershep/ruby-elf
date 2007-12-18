# Copyright 2007, Diego "Flameeyes" Pettenò <flameeyes@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this generator; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

require 'test/unit'
require 'pathname'
require 'elf'

require Pathname.new(__FILE__).dirname + 'tests_elf'

class TC_Relocatable < Test::Unit::TestCase
  TestBaseFilename = "executable.o"
  TestElfType = Elf::File::Type::Rel
  include ElfTests

  def test_elfclass
    assert(@elfs['linux_x86'].elf_class == Elf::Class::Elf32)
    assert(@elfs['linux_amd64'].elf_class == Elf::Class::Elf64)
  end

  def test_dataencoding
    assert(@elfs['linux_x86'].data_encoding == Elf::DataEncoding::Lsb)
    assert(@elfs['linux_amd64'].data_encoding == Elf::DataEncoding::Lsb)
  end

  def test_version
    assert(@elfs['linux_x86'].version == 1)
    assert(@elfs['linux_amd64'].version == 1)
  end

  def test_abi
    assert(@elfs['linux_x86'].abi == Elf::OsAbi::SysV)
    assert(@elfs['linux_x86'].abi_version == 0)

    assert(@elfs['linux_amd64'].abi == Elf::OsAbi::SysV)
    assert(@elfs['linux_amd64'].abi_version == 0)
  end

  def test_machine
    assert(@elfs['linux_x86'].machine == Elf::Machine::I386)
    assert(@elfs['linux_amd64'].machine == Elf::Machine::X8664)
  end

end
