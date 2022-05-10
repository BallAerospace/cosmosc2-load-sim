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

require 'cosmos/conversions/polynomial_conversion'

module Cosmos
  class LoadsimConversion < PolynomialConversion
    def initialize(item_name, *coeff_array)
      super(coeff_array)
      @item_name = item_name
    end

    def call(value, myself, buffer)
      value = myself.read(@item_name)
      return super(value, myself, buffer)
    end

    # @param (see Conversion#to_config)
    # @return [String] Config fragment for this conversion
    def to_config(read_or_write)
      "    READ_CONVERSION #{@item_name} #{@coeffs.join(' ')}\n"
    end

    def as_json
      { 'class' => self.class.name.to_s, 'params' => [@item_name].concat(@coeffs) }
    end
  end # class LoadsimConversion
end # module Cosmos
