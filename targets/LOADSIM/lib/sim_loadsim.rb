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

# Provides a demonstration of a Simulated Target

require 'cosmos'

module Cosmos
  # Simulated instrument for the load sim.
  class SimLoadsim < SimulatedTarget
    def initialize(target_name)
      super(target_name)
    end

    def set_rates
      period_100hz = <%= (100.0 / num_each_tlm_packet_per_sec.to_f).to_i %>
      <% num_tlm_packets.to_i.times do |index| %>
        set_rate("PKT<%= index %>", period_100hz)
      <% end %>
    end

    def write(packet)
    end

    def graceful_kill
    end

    def read(count_100hz, time)
      get_pending_packets(count_100hz)
    end
  end
end
