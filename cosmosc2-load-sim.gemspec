# encoding: ascii-8bit

# Copyright 2022 Ball Aerospace & Technologies Corp.
# All Rights Reserved.
#
# This program is free software; you can modify and/or redistribute it
# under the terms of the GNU Affero General Public License
# as published by the Free Software Foundation; version 3 with
# attribution addendums as found in the LICENSE.txt
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# This program may also be used under the terms of a commercial or
# enterprise edition license of COSMOS if purchased from the
# copyright holder

# Create the overall gemspec
spec = Gem::Specification.new do |s|
  s.name = 'cosmosc2-load-sim'
  s.summary = 'Ball Aerospace COSMOS'
  s.description = <<-EOF
  This plugin provides a load simulator target and interface to COSMOS.
  Provide key performance variables and this plugin will generate a target that produces a representative load of telemetry packets.
  EOF
  s.authors = ['Ryan Melton', 'Jason Thomas']
  s.email = ['rmelton@ball.com', 'jmthomas@ball.com']
  s.homepage = 'https://github.com/BallAerospace/COSMOS'

  s.platform = Gem::Platform::RUBY

  if ENV['VERSION']
    s.version = ENV['VERSION'].dup
  else
    time = Time.now.strftime("%Y%m%d%H%M%S")
    s.version = '0.0.0' + ".#{time}"
  end
  s.licenses = ['AGPL-3.0-only', 'Nonstandard']

  s.files = Dir.glob("{targets,lib,procedures,tools,microservices}/**/*") + %w(Rakefile LICENSE.txt README.md plugin.txt)
end
