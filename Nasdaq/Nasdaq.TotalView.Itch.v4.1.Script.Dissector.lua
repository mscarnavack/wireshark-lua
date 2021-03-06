-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Nasdaq TotalView Itch 4.1 Protocol
local nasdaq_totalview_itch_v4_1 = Proto("Nasdaq.TotalView.Itch.v4.1.Lua", "Nasdaq TotalView Itch 4.1")

-- Component Tables
local show = {}
local format = {}
local display = {}
local dissect = {}
local size_of = {}
local verify = {}

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Nasdaq TotalView Itch 4.1 Fields
nasdaq_totalview_itch_v4_1.fields.add_order_message = ProtoField.new("Add Order Message", "nasdaq.totalview.itch.v4.1.addordermessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.add_order_with_mpid_message = ProtoField.new("Add Order with Mpid Message", "nasdaq.totalview.itch.v4.1.addorderwithmpidmessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.attribution = ProtoField.new("Attribution", "nasdaq.totalview.itch.v4.1.attribution", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.broken_trade_message = ProtoField.new("Broken Trade Message", "nasdaq.totalview.itch.v4.1.brokentrademessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.canceled_shares = ProtoField.new("Canceled Shares", "nasdaq.totalview.itch.v4.1.canceledshares", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.count = ProtoField.new("Count", "nasdaq.totalview.itch.v4.1.count", ftypes.UINT16)
nasdaq_totalview_itch_v4_1.fields.cross_price = ProtoField.new("Cross Price", "nasdaq.totalview.itch.v4.1.crossprice", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.cross_trade_message = ProtoField.new("Cross Trade Message", "nasdaq.totalview.itch.v4.1.crosstrademessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.cross_type = ProtoField.new("Cross Type", "nasdaq.totalview.itch.v4.1.crosstype", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.current_reference_price = ProtoField.new("Current Reference Price", "nasdaq.totalview.itch.v4.1.currentreferenceprice", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.event_code = ProtoField.new("Event Code", "nasdaq.totalview.itch.v4.1.eventcode", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.executed_shares = ProtoField.new("Executed Shares", "nasdaq.totalview.itch.v4.1.executedshares", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.execution_price = ProtoField.new("Execution Price", "nasdaq.totalview.itch.v4.1.executionprice", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.far_price = ProtoField.new("Far Price", "nasdaq.totalview.itch.v4.1.farprice", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.financial_status_indicator = ProtoField.new("Financial Status Indicator", "nasdaq.totalview.itch.v4.1.financialstatusindicator", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.imbalance_direction = ProtoField.new("Imbalance Direction", "nasdaq.totalview.itch.v4.1.imbalancedirection", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.imbalance_shares = ProtoField.new("Imbalance Shares", "nasdaq.totalview.itch.v4.1.imbalanceshares", ftypes.UINT64)
nasdaq_totalview_itch_v4_1.fields.interest_flag = ProtoField.new("Interest Flag", "nasdaq.totalview.itch.v4.1.interestflag", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.length = ProtoField.new("Length", "nasdaq.totalview.itch.v4.1.length", ftypes.UINT16)
nasdaq_totalview_itch_v4_1.fields.market_category = ProtoField.new("Market Category", "nasdaq.totalview.itch.v4.1.marketcategory", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.market_maker_mode = ProtoField.new("Market Maker Mode", "nasdaq.totalview.itch.v4.1.marketmakermode", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.market_participant_position_message = ProtoField.new("Market Participant Position Message", "nasdaq.totalview.itch.v4.1.marketparticipantpositionmessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.market_participant_state = ProtoField.new("Market Participant State", "nasdaq.totalview.itch.v4.1.marketparticipantstate", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.match_number = ProtoField.new("Match Number", "nasdaq.totalview.itch.v4.1.matchnumber", ftypes.UINT64)
nasdaq_totalview_itch_v4_1.fields.message = ProtoField.new("Message", "nasdaq.totalview.itch.v4.1.message", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.message_header = ProtoField.new("Message Header", "nasdaq.totalview.itch.v4.1.messageheader", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.message_type = ProtoField.new("Message Type", "nasdaq.totalview.itch.v4.1.messagetype", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.mpid = ProtoField.new("Mpid", "nasdaq.totalview.itch.v4.1.mpid", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.near_price = ProtoField.new("Near Price", "nasdaq.totalview.itch.v4.1.nearprice", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.net_order_imbalance_indicator_message = ProtoField.new("Net Order Imbalance Indicator Message", "nasdaq.totalview.itch.v4.1.netorderimbalanceindicatormessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.new_order_reference_number = ProtoField.new("New Order Reference Number", "nasdaq.totalview.itch.v4.1.neworderreferencenumber", ftypes.UINT64)
nasdaq_totalview_itch_v4_1.fields.order_cancel_message = ProtoField.new("Order Cancel Message", "nasdaq.totalview.itch.v4.1.ordercancelmessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.order_delete_message = ProtoField.new("Order Delete Message", "nasdaq.totalview.itch.v4.1.orderdeletemessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.order_executed_message = ProtoField.new("Order Executed Message", "nasdaq.totalview.itch.v4.1.orderexecutedmessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.order_executed_with_price_message = ProtoField.new("Order Executed With Price Message", "nasdaq.totalview.itch.v4.1.orderexecutedwithpricemessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.order_reference_number = ProtoField.new("Order Reference Number", "nasdaq.totalview.itch.v4.1.orderreferencenumber", ftypes.UINT64)
nasdaq_totalview_itch_v4_1.fields.order_replace_message = ProtoField.new("Order Replace Message", "nasdaq.totalview.itch.v4.1.orderreplacemessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.original_order_reference_number = ProtoField.new("Original Order Reference Number", "nasdaq.totalview.itch.v4.1.originalorderreferencenumber", ftypes.UINT64)
nasdaq_totalview_itch_v4_1.fields.packet = ProtoField.new("Packet", "nasdaq.totalview.itch.v4.1.packet", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.packet_header = ProtoField.new("Packet Header", "nasdaq.totalview.itch.v4.1.packetheader", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.paired_shares = ProtoField.new("Paired Shares", "nasdaq.totalview.itch.v4.1.pairedshares", ftypes.UINT64)
nasdaq_totalview_itch_v4_1.fields.payload = ProtoField.new("Payload", "nasdaq.totalview.itch.v4.1.payload", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.price = ProtoField.new("Price", "nasdaq.totalview.itch.v4.1.price", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.price_variation_indicator = ProtoField.new("Price Variation Indicator", "nasdaq.totalview.itch.v4.1.pricevariationindicator", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.primary_market_maker = ProtoField.new("Primary Market Maker", "nasdaq.totalview.itch.v4.1.primarymarketmaker", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.printable = ProtoField.new("Printable", "nasdaq.totalview.itch.v4.1.printable", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.reg_sho_action = ProtoField.new("Reg Sho Action", "nasdaq.totalview.itch.v4.1.regshoaction", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.reg_sho_short_sale_price_test_restricted_indicator_message = ProtoField.new("Reg Sho Short Sale Price Test Restricted Indicator Message", "nasdaq.totalview.itch.v4.1.regshoshortsalepricetestrestrictedindicatormessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.retail_price_improvement_indicator_message = ProtoField.new("Retail Price Improvement Indicator Message", "nasdaq.totalview.itch.v4.1.retailpriceimprovementindicatormessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.second = ProtoField.new("Second", "nasdaq.totalview.itch.v4.1.second", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.sequence = ProtoField.new("Sequence", "nasdaq.totalview.itch.v4.1.sequence", ftypes.UINT64)
nasdaq_totalview_itch_v4_1.fields.session = ProtoField.new("Session", "nasdaq.totalview.itch.v4.1.session", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.shares = ProtoField.new("Shares", "nasdaq.totalview.itch.v4.1.shares", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.side = ProtoField.new("Side", "nasdaq.totalview.itch.v4.1.side", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.stock = ProtoField.new("Stock", "nasdaq.totalview.itch.v4.1.stock", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.stock_directory_message = ProtoField.new("Stock Directory Message", "nasdaq.totalview.itch.v4.1.stockdirectorymessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.system_event_message = ProtoField.new("System Event Message", "nasdaq.totalview.itch.v4.1.systemeventmessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.time_stamp_message = ProtoField.new("Time Stamp Message", "nasdaq.totalview.itch.v4.1.timestampmessage", ftypes.STRING)
nasdaq_totalview_itch_v4_1.fields.timestamp = ProtoField.new("Timestamp", "nasdaq.totalview.itch.v4.1.timestamp", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.timestamp__nanoseconds = ProtoField.new("Timestamp  Nanoseconds", "nasdaq.totalview.itch.v4.1.timestampnanoseconds", ftypes.UINT32)
nasdaq_totalview_itch_v4_1.fields.trade_message = ProtoField.new("Trade Message", "nasdaq.totalview.itch.v4.1.trademessage", ftypes.STRING)

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Nasdaq TotalView Itch 4.1 Element Dissection Options
show.add_order_message = true
show.add_order_with_mpid_message = true
show.broken_trade_message = true
show.cross_trade_message = true
show.market_participant_position_message = true
show.message = true
show.message_header = true
show.net_order_imbalance_indicator_message = true
show.order_cancel_message = true
show.order_delete_message = true
show.order_executed_message = true
show.order_executed_with_price_message = true
show.order_replace_message = true
show.packet = true
show.packet_header = true
show.reg_sho_short_sale_price_test_restricted_indicator_message = true
show.retail_price_improvement_indicator_message = true
show.stock_directory_message = true
show.system_event_message = true
show.time_stamp_message = true
show.trade_message = true
show.payload = false

-- Register Nasdaq TotalView Itch 4.1 Show Options
nasdaq_totalview_itch_v4_1.prefs.show_add_order_message = Pref.bool("Show Add Order Message", show.add_order_message, "Parse and add Add Order Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_add_order_with_mpid_message = Pref.bool("Show Add Order with Mpid Message", show.add_order_with_mpid_message, "Parse and add Add Order with Mpid Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_broken_trade_message = Pref.bool("Show Broken Trade Message", show.broken_trade_message, "Parse and add Broken Trade Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_cross_trade_message = Pref.bool("Show Cross Trade Message", show.cross_trade_message, "Parse and add Cross Trade Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_market_participant_position_message = Pref.bool("Show Market Participant Position Message", show.market_participant_position_message, "Parse and add Market Participant Position Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_message = Pref.bool("Show Message", show.message, "Parse and add Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_message_header = Pref.bool("Show Message Header", show.message_header, "Parse and add Message Header to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_net_order_imbalance_indicator_message = Pref.bool("Show Net Order Imbalance Indicator Message", show.net_order_imbalance_indicator_message, "Parse and add Net Order Imbalance Indicator Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_order_cancel_message = Pref.bool("Show Order Cancel Message", show.order_cancel_message, "Parse and add Order Cancel Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_order_delete_message = Pref.bool("Show Order Delete Message", show.order_delete_message, "Parse and add Order Delete Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_order_executed_message = Pref.bool("Show Order Executed Message", show.order_executed_message, "Parse and add Order Executed Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_order_executed_with_price_message = Pref.bool("Show Order Executed With Price Message", show.order_executed_with_price_message, "Parse and add Order Executed With Price Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_order_replace_message = Pref.bool("Show Order Replace Message", show.order_replace_message, "Parse and add Order Replace Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_packet = Pref.bool("Show Packet", show.packet, "Parse and add Packet to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_packet_header = Pref.bool("Show Packet Header", show.packet_header, "Parse and add Packet Header to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_reg_sho_short_sale_price_test_restricted_indicator_message = Pref.bool("Show Reg Sho Short Sale Price Test Restricted Indicator Message", show.reg_sho_short_sale_price_test_restricted_indicator_message, "Parse and add Reg Sho Short Sale Price Test Restricted Indicator Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_retail_price_improvement_indicator_message = Pref.bool("Show Retail Price Improvement Indicator Message", show.retail_price_improvement_indicator_message, "Parse and add Retail Price Improvement Indicator Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_stock_directory_message = Pref.bool("Show Stock Directory Message", show.stock_directory_message, "Parse and add Stock Directory Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_system_event_message = Pref.bool("Show System Event Message", show.system_event_message, "Parse and add System Event Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_time_stamp_message = Pref.bool("Show Time Stamp Message", show.time_stamp_message, "Parse and add Time Stamp Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_trade_message = Pref.bool("Show Trade Message", show.trade_message, "Parse and add Trade Message to protocol tree")
nasdaq_totalview_itch_v4_1.prefs.show_payload = Pref.bool("Show Payload", show.payload, "Parse and add Payload to protocol tree")

-- Handle changed preferences
function nasdaq_totalview_itch_v4_1.prefs_changed()
  local changed = false

  -- Check if show options have changed
  if show.add_order_message ~= nasdaq_totalview_itch_v4_1.prefs.show_add_order_message then
    show.add_order_message = nasdaq_totalview_itch_v4_1.prefs.show_add_order_message
    changed = true
  end
  if show.add_order_with_mpid_message ~= nasdaq_totalview_itch_v4_1.prefs.show_add_order_with_mpid_message then
    show.add_order_with_mpid_message = nasdaq_totalview_itch_v4_1.prefs.show_add_order_with_mpid_message
    changed = true
  end
  if show.broken_trade_message ~= nasdaq_totalview_itch_v4_1.prefs.show_broken_trade_message then
    show.broken_trade_message = nasdaq_totalview_itch_v4_1.prefs.show_broken_trade_message
    changed = true
  end
  if show.cross_trade_message ~= nasdaq_totalview_itch_v4_1.prefs.show_cross_trade_message then
    show.cross_trade_message = nasdaq_totalview_itch_v4_1.prefs.show_cross_trade_message
    changed = true
  end
  if show.market_participant_position_message ~= nasdaq_totalview_itch_v4_1.prefs.show_market_participant_position_message then
    show.market_participant_position_message = nasdaq_totalview_itch_v4_1.prefs.show_market_participant_position_message
    changed = true
  end
  if show.message ~= nasdaq_totalview_itch_v4_1.prefs.show_message then
    show.message = nasdaq_totalview_itch_v4_1.prefs.show_message
    changed = true
  end
  if show.message_header ~= nasdaq_totalview_itch_v4_1.prefs.show_message_header then
    show.message_header = nasdaq_totalview_itch_v4_1.prefs.show_message_header
    changed = true
  end
  if show.net_order_imbalance_indicator_message ~= nasdaq_totalview_itch_v4_1.prefs.show_net_order_imbalance_indicator_message then
    show.net_order_imbalance_indicator_message = nasdaq_totalview_itch_v4_1.prefs.show_net_order_imbalance_indicator_message
    changed = true
  end
  if show.order_cancel_message ~= nasdaq_totalview_itch_v4_1.prefs.show_order_cancel_message then
    show.order_cancel_message = nasdaq_totalview_itch_v4_1.prefs.show_order_cancel_message
    changed = true
  end
  if show.order_delete_message ~= nasdaq_totalview_itch_v4_1.prefs.show_order_delete_message then
    show.order_delete_message = nasdaq_totalview_itch_v4_1.prefs.show_order_delete_message
    changed = true
  end
  if show.order_executed_message ~= nasdaq_totalview_itch_v4_1.prefs.show_order_executed_message then
    show.order_executed_message = nasdaq_totalview_itch_v4_1.prefs.show_order_executed_message
    changed = true
  end
  if show.order_executed_with_price_message ~= nasdaq_totalview_itch_v4_1.prefs.show_order_executed_with_price_message then
    show.order_executed_with_price_message = nasdaq_totalview_itch_v4_1.prefs.show_order_executed_with_price_message
    changed = true
  end
  if show.order_replace_message ~= nasdaq_totalview_itch_v4_1.prefs.show_order_replace_message then
    show.order_replace_message = nasdaq_totalview_itch_v4_1.prefs.show_order_replace_message
    changed = true
  end
  if show.packet ~= nasdaq_totalview_itch_v4_1.prefs.show_packet then
    show.packet = nasdaq_totalview_itch_v4_1.prefs.show_packet
    changed = true
  end
  if show.packet_header ~= nasdaq_totalview_itch_v4_1.prefs.show_packet_header then
    show.packet_header = nasdaq_totalview_itch_v4_1.prefs.show_packet_header
    changed = true
  end
  if show.reg_sho_short_sale_price_test_restricted_indicator_message ~= nasdaq_totalview_itch_v4_1.prefs.show_reg_sho_short_sale_price_test_restricted_indicator_message then
    show.reg_sho_short_sale_price_test_restricted_indicator_message = nasdaq_totalview_itch_v4_1.prefs.show_reg_sho_short_sale_price_test_restricted_indicator_message
    changed = true
  end
  if show.retail_price_improvement_indicator_message ~= nasdaq_totalview_itch_v4_1.prefs.show_retail_price_improvement_indicator_message then
    show.retail_price_improvement_indicator_message = nasdaq_totalview_itch_v4_1.prefs.show_retail_price_improvement_indicator_message
    changed = true
  end
  if show.stock_directory_message ~= nasdaq_totalview_itch_v4_1.prefs.show_stock_directory_message then
    show.stock_directory_message = nasdaq_totalview_itch_v4_1.prefs.show_stock_directory_message
    changed = true
  end
  if show.system_event_message ~= nasdaq_totalview_itch_v4_1.prefs.show_system_event_message then
    show.system_event_message = nasdaq_totalview_itch_v4_1.prefs.show_system_event_message
    changed = true
  end
  if show.time_stamp_message ~= nasdaq_totalview_itch_v4_1.prefs.show_time_stamp_message then
    show.time_stamp_message = nasdaq_totalview_itch_v4_1.prefs.show_time_stamp_message
    changed = true
  end
  if show.trade_message ~= nasdaq_totalview_itch_v4_1.prefs.show_trade_message then
    show.trade_message = nasdaq_totalview_itch_v4_1.prefs.show_trade_message
    changed = true
  end
  if show.payload ~= nasdaq_totalview_itch_v4_1.prefs.show_payload then
    show.payload = nasdaq_totalview_itch_v4_1.prefs.show_payload
    changed = true
  end

  -- Reload on changed preference
  if changed then
    reload()
  end
end


-----------------------------------------------------------------------
-- Dissect Nasdaq TotalView Itch 4.1
-----------------------------------------------------------------------

-- Size: Interest Flag
size_of.interest_flag = 1

-- Display: Interest Flag
display.interest_flag = function(value)
  if value == "B" then
    return "Interest Flag: Rpi Buy (B)"
  end
  if value == "S" then
    return "Interest Flag: Rpi Sell (S)"
  end
  if value == "A" then
    return "Interest Flag: RpiBoth (A)"
  end
  if value == "N" then
    return "Interest Flag: No Rpi (N)"
  end

  return "Interest Flag: Unknown("..value..")"
end

-- Dissect: Interest Flag
dissect.interest_flag = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.interest_flag)
  local value = range:string()
  local display = display.interest_flag(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.interest_flag, range, value, display)

  return offset + size_of.interest_flag
end

-- Size: Stock
size_of.stock = 8

-- Display: Stock
display.stock = function(value)
  return "Stock: "..value
end

-- Dissect: Stock
dissect.stock = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.stock)
  local value = range:string()
  local display = display.stock(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.stock, range, value, display)

  return offset + size_of.stock
end

-- Size: Timestamp
size_of.timestamp = 4

-- Display: Timestamp
display.timestamp = function(value)
  return "Timestamp: "..value
end

-- Dissect: Timestamp
dissect.timestamp = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.timestamp)
  local value = range:uint()
  local display = display.timestamp(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.timestamp, range, value, display)

  return offset + size_of.timestamp
end

-- Display: Retail Price Improvement Indicator Message
display.retail_price_improvement_indicator_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Retail Price Improvement Indicator Message
dissect.retail_price_improvement_indicator_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Stock: 8 Byte Ascii String
  index = dissect.stock(buffer, index, packet, parent)

  -- Interest Flag: 1 Byte Ascii String Enum with 4 values
  index = dissect.interest_flag(buffer, index, packet, parent)

  return index
end

-- Dissect: Retail Price Improvement Indicator Message
dissect.retail_price_improvement_indicator_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.retail_price_improvement_indicator_message then
    local range = buffer(offset, 13)
    local display = display.retail_price_improvement_indicator_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.retail_price_improvement_indicator_message, range, display)
  end

  return dissect.retail_price_improvement_indicator_message_fields(buffer, offset, packet, parent)
end

-- Size: Price Variation Indicator
size_of.price_variation_indicator = 1

-- Display: Price Variation Indicator
display.price_variation_indicator = function(value)
  if value == "L" then
    return "Price Variation Indicator: Less (L)"
  end
  if value == "1" then
    return "Price Variation Indicator: 1 to 1.99% (1)"
  end
  if value == "2" then
    return "Price Variation Indicator: 2 to 2.99% (2)"
  end
  if value == "3" then
    return "Price Variation Indicator: 3 to 3.99% (3)"
  end
  if value == "4" then
    return "Price Variation Indicator: 4 to 4.99% (4)"
  end
  if value == "5" then
    return "Price Variation Indicator: 5 to 5.99% (5)"
  end
  if value == "6" then
    return "Price Variation Indicator: 6 to 6.99% (6)"
  end
  if value == "7" then
    return "Price Variation Indicator: 7 to 7.99% (7)"
  end
  if value == "8" then
    return "Price Variation Indicator: 8 to 8.99% (8)"
  end
  if value == "9" then
    return "Price Variation Indicator: 9 to 9.99% (9)"
  end
  if value == "A" then
    return "Price Variation Indicator: 10 to 19.99% (A)"
  end
  if value == "B" then
    return "Price Variation Indicator: 20 to 29.99% (B)"
  end
  if value == "C" then
    return "Price Variation Indicator: 30% or greater (C)"
  end
  if value == " " then
    return "Price Variation Indicator: NoCalculation (<whitespace>)"
  end

  return "Price Variation Indicator: Unknown("..value..")"
end

-- Dissect: Price Variation Indicator
dissect.price_variation_indicator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.price_variation_indicator)
  local value = range:string()
  local display = display.price_variation_indicator(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.price_variation_indicator, range, value, display)

  return offset + size_of.price_variation_indicator
end

-- Size: Cross Type
size_of.cross_type = 1

-- Display: Cross Type
display.cross_type = function(value)
  if value == "O" then
    return "Cross Type: Opening (O)"
  end
  if value == "C" then
    return "Cross Type: Closing (C)"
  end
  if value == "H" then
    return "Cross Type: Cross for IPO and halted (H)"
  end
  if value == "I" then
    return "Cross Type: NASDAQ Cross Network (I)"
  end

  return "Cross Type: Unknown("..value..")"
end

-- Dissect: Cross Type
dissect.cross_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.cross_type)
  local value = range:string()
  local display = display.cross_type(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.cross_type, range, value, display)

  return offset + size_of.cross_type
end

-- Size: Current Reference Price
size_of.current_reference_price = 4

-- Display: Current Reference Price
display.current_reference_price = function(value)
  return "Current Reference Price: "..value
end

-- Dissect: Current Reference Price
dissect.current_reference_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.current_reference_price)
  local value = range:uint()
  local display = display.current_reference_price(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.current_reference_price, range, value, display)

  return offset + size_of.current_reference_price
end

-- Size: Near Price
size_of.near_price = 4

-- Display: Near Price
display.near_price = function(value)
  return "Near Price: "..value
end

-- Dissect: Near Price
dissect.near_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.near_price)
  local value = range:uint()
  local display = display.near_price(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.near_price, range, value, display)

  return offset + size_of.near_price
end

-- Size: Far Price
size_of.far_price = 4

-- Display: Far Price
display.far_price = function(value)
  return "Far Price: "..value
end

-- Dissect: Far Price
dissect.far_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.far_price)
  local value = range:uint()
  local display = display.far_price(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.far_price, range, value, display)

  return offset + size_of.far_price
end

-- Size: Imbalance Direction
size_of.imbalance_direction = 1

-- Display: Imbalance Direction
display.imbalance_direction = function(value)
  if value == "B" then
    return "Imbalance Direction: buy (B)"
  end
  if value == "S" then
    return "Imbalance Direction: sell (S)"
  end
  if value == "N" then
    return "Imbalance Direction: no (N)"
  end
  if value == "O" then
    return "Imbalance Direction: Insufficient orders (O)"
  end

  return "Imbalance Direction: Unknown("..value..")"
end

-- Dissect: Imbalance Direction
dissect.imbalance_direction = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.imbalance_direction)
  local value = range:string()
  local display = display.imbalance_direction(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.imbalance_direction, range, value, display)

  return offset + size_of.imbalance_direction
end

-- Size: Imbalance Shares
size_of.imbalance_shares = 8

-- Display: Imbalance Shares
display.imbalance_shares = function(value)
  return "Imbalance Shares: "..value
end

-- Dissect: Imbalance Shares
dissect.imbalance_shares = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.imbalance_shares)
  local value = range:uint64()
  local display = display.imbalance_shares(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.imbalance_shares, range, value, display)

  return offset + size_of.imbalance_shares
end

-- Size: Paired Shares
size_of.paired_shares = 8

-- Display: Paired Shares
display.paired_shares = function(value)
  return "Paired Shares: "..value
end

-- Dissect: Paired Shares
dissect.paired_shares = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.paired_shares)
  local value = range:uint64()
  local display = display.paired_shares(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.paired_shares, range, value, display)

  return offset + size_of.paired_shares
end

-- Display: Net Order Imbalance Indicator Message
display.net_order_imbalance_indicator_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Net Order Imbalance Indicator Message
dissect.net_order_imbalance_indicator_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Paired Shares: 8 Byte Unsigned Fixed Width Integer
  index = dissect.paired_shares(buffer, index, packet, parent)

  -- Imbalance Shares: 8 Byte Unsigned Fixed Width Integer
  index = dissect.imbalance_shares(buffer, index, packet, parent)

  -- Imbalance Direction: 1 Byte Ascii String Enum with 4 values
  index = dissect.imbalance_direction(buffer, index, packet, parent)

  -- Stock: 8 Byte Ascii String
  index = dissect.stock(buffer, index, packet, parent)

  -- Far Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.far_price(buffer, index, packet, parent)

  -- Near Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.near_price(buffer, index, packet, parent)

  -- Current Reference Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.current_reference_price(buffer, index, packet, parent)

  -- Cross Type: 1 Byte Ascii String Enum with 4 values
  index = dissect.cross_type(buffer, index, packet, parent)

  -- Price Variation Indicator: 1 Byte Ascii String Enum with 14 values
  index = dissect.price_variation_indicator(buffer, index, packet, parent)

  return index
end

-- Dissect: Net Order Imbalance Indicator Message
dissect.net_order_imbalance_indicator_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.net_order_imbalance_indicator_message then
    local range = buffer(offset, 43)
    local display = display.net_order_imbalance_indicator_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.net_order_imbalance_indicator_message, range, display)
  end

  return dissect.net_order_imbalance_indicator_message_fields(buffer, offset, packet, parent)
end

-- Size: Match Number
size_of.match_number = 8

-- Display: Match Number
display.match_number = function(value)
  return "Match Number: "..value
end

-- Dissect: Match Number
dissect.match_number = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.match_number)
  local value = range:uint64()
  local display = display.match_number(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.match_number, range, value, display)

  return offset + size_of.match_number
end

-- Display: Broken Trade Message
display.broken_trade_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Broken Trade Message
dissect.broken_trade_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Match Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Broken Trade Message
dissect.broken_trade_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.broken_trade_message then
    local range = buffer(offset, 12)
    local display = display.broken_trade_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.broken_trade_message, range, display)
  end

  return dissect.broken_trade_message_fields(buffer, offset, packet, parent)
end

-- Size: Cross Price
size_of.cross_price = 4

-- Display: Cross Price
display.cross_price = function(value)
  return "Cross Price: "..value
end

-- Dissect: Cross Price
dissect.cross_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.cross_price)
  local value = range:uint()
  local display = display.cross_price(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.cross_price, range, value, display)

  return offset + size_of.cross_price
end

-- Size: Shares
size_of.shares = 4

-- Display: Shares
display.shares = function(value)
  return "Shares: "..value
end

-- Dissect: Shares
dissect.shares = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.shares)
  local value = range:uint()
  local display = display.shares(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.shares, range, value, display)

  return offset + size_of.shares
end

-- Display: Cross Trade Message
display.cross_trade_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Cross Trade Message
dissect.cross_trade_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Shares: 4 Byte Unsigned Fixed Width Integer
  index = dissect.shares(buffer, index, packet, parent)

  -- Stock: 8 Byte Ascii String
  index = dissect.stock(buffer, index, packet, parent)

  -- Cross Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.cross_price(buffer, index, packet, parent)

  -- Match Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  -- Cross Type: 1 Byte Ascii String Enum with 4 values
  index = dissect.cross_type(buffer, index, packet, parent)

  return index
end

-- Dissect: Cross Trade Message
dissect.cross_trade_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.cross_trade_message then
    local range = buffer(offset, 29)
    local display = display.cross_trade_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.cross_trade_message, range, display)
  end

  return dissect.cross_trade_message_fields(buffer, offset, packet, parent)
end

-- Size: Price
size_of.price = 4

-- Display: Price
display.price = function(value)
  return "Price: "..value
end

-- Dissect: Price
dissect.price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.price)
  local value = range:uint()
  local display = display.price(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.price, range, value, display)

  return offset + size_of.price
end

-- Size: Side
size_of.side = 1

-- Display: Side
display.side = function(value)
  if value == "B" then
    return "Side: buy (B)"
  end
  if value == "S" then
    return "Side: sell (S)"
  end

  return "Side: Unknown("..value..")"
end

-- Dissect: Side
dissect.side = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.side)
  local value = range:string()
  local display = display.side(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.side, range, value, display)

  return offset + size_of.side
end

-- Size: Order Reference Number
size_of.order_reference_number = 8

-- Display: Order Reference Number
display.order_reference_number = function(value)
  return "Order Reference Number: "..value
end

-- Dissect: Order Reference Number
dissect.order_reference_number = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.order_reference_number)
  local value = range:uint64()
  local display = display.order_reference_number(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.order_reference_number, range, value, display)

  return offset + size_of.order_reference_number
end

-- Display: Trade Message
display.trade_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Trade Message
dissect.trade_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Order Reference Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_reference_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Shares: 4 Byte Unsigned Fixed Width Integer
  index = dissect.shares(buffer, index, packet, parent)

  -- Stock: 8 Byte Ascii String
  index = dissect.stock(buffer, index, packet, parent)

  -- Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Match Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Trade Message
dissect.trade_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.trade_message then
    local range = buffer(offset, 37)
    local display = display.trade_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.trade_message, range, display)
  end

  return dissect.trade_message_fields(buffer, offset, packet, parent)
end

-- Size: New Order Reference Number
size_of.new_order_reference_number = 8

-- Display: New Order Reference Number
display.new_order_reference_number = function(value)
  return "New Order Reference Number: "..value
end

-- Dissect: New Order Reference Number
dissect.new_order_reference_number = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.new_order_reference_number)
  local value = range:uint64()
  local display = display.new_order_reference_number(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.new_order_reference_number, range, value, display)

  return offset + size_of.new_order_reference_number
end

-- Size: Original Order Reference Number
size_of.original_order_reference_number = 8

-- Display: Original Order Reference Number
display.original_order_reference_number = function(value)
  return "Original Order Reference Number: "..value
end

-- Dissect: Original Order Reference Number
dissect.original_order_reference_number = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.original_order_reference_number)
  local value = range:uint64()
  local display = display.original_order_reference_number(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.original_order_reference_number, range, value, display)

  return offset + size_of.original_order_reference_number
end

-- Size: Timestamp  Nanoseconds
size_of.timestamp__nanoseconds = 4

-- Display: Timestamp  Nanoseconds
display.timestamp__nanoseconds = function(value)
  return "Timestamp  Nanoseconds: "..value
end

-- Dissect: Timestamp  Nanoseconds
dissect.timestamp__nanoseconds = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.timestamp__nanoseconds)
  local value = range:uint()
  local display = display.timestamp__nanoseconds(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.timestamp__nanoseconds, range, value, display)

  return offset + size_of.timestamp__nanoseconds
end

-- Display: Order Replace Message
display.order_replace_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Replace Message
dissect.order_replace_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp  Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp__nanoseconds(buffer, index, packet, parent)

  -- Original Order Reference Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.original_order_reference_number(buffer, index, packet, parent)

  -- New Order Reference Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.new_order_reference_number(buffer, index, packet, parent)

  -- Shares: 4 Byte Unsigned Fixed Width Integer
  index = dissect.shares(buffer, index, packet, parent)

  -- Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Replace Message
dissect.order_replace_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_replace_message then
    local range = buffer(offset, 28)
    local display = display.order_replace_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.order_replace_message, range, display)
  end

  return dissect.order_replace_message_fields(buffer, offset, packet, parent)
end

-- Display: Order Delete Message
display.order_delete_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Delete Message
dissect.order_delete_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Order Reference Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_reference_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Delete Message
dissect.order_delete_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_delete_message then
    local range = buffer(offset, 12)
    local display = display.order_delete_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.order_delete_message, range, display)
  end

  return dissect.order_delete_message_fields(buffer, offset, packet, parent)
end

-- Size: Canceled Shares
size_of.canceled_shares = 4

-- Display: Canceled Shares
display.canceled_shares = function(value)
  return "Canceled Shares: "..value
end

-- Dissect: Canceled Shares
dissect.canceled_shares = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.canceled_shares)
  local value = range:uint()
  local display = display.canceled_shares(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.canceled_shares, range, value, display)

  return offset + size_of.canceled_shares
end

-- Display: Order Cancel Message
display.order_cancel_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Cancel Message
dissect.order_cancel_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Order Reference Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_reference_number(buffer, index, packet, parent)

  -- Canceled Shares: 4 Byte Unsigned Fixed Width Integer
  index = dissect.canceled_shares(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Cancel Message
dissect.order_cancel_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_cancel_message then
    local range = buffer(offset, 16)
    local display = display.order_cancel_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.order_cancel_message, range, display)
  end

  return dissect.order_cancel_message_fields(buffer, offset, packet, parent)
end

-- Size: Execution Price
size_of.execution_price = 4

-- Display: Execution Price
display.execution_price = function(value)
  return "Execution Price: "..value
end

-- Dissect: Execution Price
dissect.execution_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.execution_price)
  local value = range:uint()
  local display = display.execution_price(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.execution_price, range, value, display)

  return offset + size_of.execution_price
end

-- Size: Printable
size_of.printable = 1

-- Display: Printable
display.printable = function(value)
  if value == "N" then
    return "Printable: nonprintable (N)"
  end
  if value == "Y" then
    return "Printable: printable (Y)"
  end

  return "Printable: Unknown("..value..")"
end

-- Dissect: Printable
dissect.printable = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.printable)
  local value = range:string()
  local display = display.printable(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.printable, range, value, display)

  return offset + size_of.printable
end

-- Size: Executed Shares
size_of.executed_shares = 4

-- Display: Executed Shares
display.executed_shares = function(value)
  return "Executed Shares: "..value
end

-- Dissect: Executed Shares
dissect.executed_shares = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.executed_shares)
  local value = range:uint()
  local display = display.executed_shares(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.executed_shares, range, value, display)

  return offset + size_of.executed_shares
end

-- Display: Order Executed With Price Message
display.order_executed_with_price_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Executed With Price Message
dissect.order_executed_with_price_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Order Reference Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_reference_number(buffer, index, packet, parent)

  -- Executed Shares: 4 Byte Unsigned Fixed Width Integer
  index = dissect.executed_shares(buffer, index, packet, parent)

  -- Match Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  -- Printable: 1 Byte Ascii String Enum with 2 values
  index = dissect.printable(buffer, index, packet, parent)

  -- Execution Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.execution_price(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Executed With Price Message
dissect.order_executed_with_price_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_executed_with_price_message then
    local range = buffer(offset, 29)
    local display = display.order_executed_with_price_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.order_executed_with_price_message, range, display)
  end

  return dissect.order_executed_with_price_message_fields(buffer, offset, packet, parent)
end

-- Display: Order Executed Message
display.order_executed_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Executed Message
dissect.order_executed_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Order Reference Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_reference_number(buffer, index, packet, parent)

  -- Executed Shares: 4 Byte Unsigned Fixed Width Integer
  index = dissect.executed_shares(buffer, index, packet, parent)

  -- Match Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Executed Message
dissect.order_executed_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_executed_message then
    local range = buffer(offset, 24)
    local display = display.order_executed_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.order_executed_message, range, display)
  end

  return dissect.order_executed_message_fields(buffer, offset, packet, parent)
end

-- Size: Attribution
size_of.attribution = 4

-- Display: Attribution
display.attribution = function(value)
  return "Attribution: "..value
end

-- Dissect: Attribution
dissect.attribution = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.attribution)
  local value = range:string()
  local display = display.attribution(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.attribution, range, value, display)

  return offset + size_of.attribution
end

-- Display: Add Order with Mpid Message
display.add_order_with_mpid_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Add Order with Mpid Message
dissect.add_order_with_mpid_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Order Reference Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_reference_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Shares: 4 Byte Unsigned Fixed Width Integer
  index = dissect.shares(buffer, index, packet, parent)

  -- Stock: 8 Byte Ascii String
  index = dissect.stock(buffer, index, packet, parent)

  -- Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Attribution: 4 Byte Ascii String
  index = dissect.attribution(buffer, index, packet, parent)

  return index
end

-- Dissect: Add Order with Mpid Message
dissect.add_order_with_mpid_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.add_order_with_mpid_message then
    local range = buffer(offset, 33)
    local display = display.add_order_with_mpid_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.add_order_with_mpid_message, range, display)
  end

  return dissect.add_order_with_mpid_message_fields(buffer, offset, packet, parent)
end

-- Display: Add Order Message
display.add_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Add Order Message
dissect.add_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Order Reference Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_reference_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Shares: 4 Byte Unsigned Fixed Width Integer
  index = dissect.shares(buffer, index, packet, parent)

  -- Stock: 8 Byte Ascii String
  index = dissect.stock(buffer, index, packet, parent)

  -- Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  return index
end

-- Dissect: Add Order Message
dissect.add_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.add_order_message then
    local range = buffer(offset, 29)
    local display = display.add_order_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.add_order_message, range, display)
  end

  return dissect.add_order_message_fields(buffer, offset, packet, parent)
end

-- Size: Market Participant State
size_of.market_participant_state = 1

-- Display: Market Participant State
display.market_participant_state = function(value)
  if value == "A" then
    return "Market Participant State: Active (A)"
  end
  if value == "E" then
    return "Market Participant State: ExcusedWithdrawn (E)"
  end
  if value == "W" then
    return "Market Participant State: Withdrawn (W)"
  end
  if value == "S" then
    return "Market Participant State: Suspended (S)"
  end
  if value == "D" then
    return "Market Participant State: Deleted (D)"
  end

  return "Market Participant State: Unknown("..value..")"
end

-- Dissect: Market Participant State
dissect.market_participant_state = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.market_participant_state)
  local value = range:string()
  local display = display.market_participant_state(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.market_participant_state, range, value, display)

  return offset + size_of.market_participant_state
end

-- Size: Market Maker Mode
size_of.market_maker_mode = 1

-- Display: Market Maker Mode
display.market_maker_mode = function(value)
  if value == "N" then
    return "Market Maker Mode: normal (N)"
  end
  if value == "P" then
    return "Market Maker Mode: passive (P)"
  end
  if value == "S" then
    return "Market Maker Mode: syndicate (S)"
  end
  if value == "L" then
    return "Market Maker Mode: penalty (L)"
  end

  return "Market Maker Mode: Unknown("..value..")"
end

-- Dissect: Market Maker Mode
dissect.market_maker_mode = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.market_maker_mode)
  local value = range:string()
  local display = display.market_maker_mode(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.market_maker_mode, range, value, display)

  return offset + size_of.market_maker_mode
end

-- Size: Primary Market Maker
size_of.primary_market_maker = 1

-- Display: Primary Market Maker
display.primary_market_maker = function(value)
  if value == "Y" then
    return "Primary Market Maker: primary (Y)"
  end
  if value == "N" then
    return "Primary Market Maker: nonprimary (N)"
  end

  return "Primary Market Maker: Unknown("..value..")"
end

-- Dissect: Primary Market Maker
dissect.primary_market_maker = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.primary_market_maker)
  local value = range:string()
  local display = display.primary_market_maker(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.primary_market_maker, range, value, display)

  return offset + size_of.primary_market_maker
end

-- Size: Mpid
size_of.mpid = 4

-- Display: Mpid
display.mpid = function(value)
  return "Mpid: "..value
end

-- Dissect: Mpid
dissect.mpid = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.mpid)
  local value = range:string()
  local display = display.mpid(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.mpid, range, value, display)

  return offset + size_of.mpid
end

-- Display: Market Participant Position Message
display.market_participant_position_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Market Participant Position Message
dissect.market_participant_position_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Mpid: 4 Byte Ascii String
  index = dissect.mpid(buffer, index, packet, parent)

  -- Stock: 8 Byte Ascii String
  index = dissect.stock(buffer, index, packet, parent)

  -- Primary Market Maker: 1 Byte Ascii String Enum with 2 values
  index = dissect.primary_market_maker(buffer, index, packet, parent)

  -- Market Maker Mode: 1 Byte Ascii String Enum with 4 values
  index = dissect.market_maker_mode(buffer, index, packet, parent)

  -- Market Participant State: 1 Byte Ascii String Enum with 5 values
  index = dissect.market_participant_state(buffer, index, packet, parent)

  return index
end

-- Dissect: Market Participant Position Message
dissect.market_participant_position_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.market_participant_position_message then
    local range = buffer(offset, 19)
    local display = display.market_participant_position_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.market_participant_position_message, range, display)
  end

  return dissect.market_participant_position_message_fields(buffer, offset, packet, parent)
end

-- Size: Reg Sho Action
size_of.reg_sho_action = 1

-- Display: Reg Sho Action
display.reg_sho_action = function(value)
  if value == "0" then
    return "Reg Sho Action: No price (0)"
  end
  if value == "1" then
    return "Reg Sho Action: Reg SHO Short Sale Price Test Restriction (1)"
  end
  if value == "2" then
    return "Reg Sho Action: Reg SHO Short Sale Price Test (2)"
  end

  return "Reg Sho Action: Unknown("..value..")"
end

-- Dissect: Reg Sho Action
dissect.reg_sho_action = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.reg_sho_action)
  local value = range:string()
  local display = display.reg_sho_action(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.reg_sho_action, range, value, display)

  return offset + size_of.reg_sho_action
end

-- Display: Reg Sho Short Sale Price Test Restricted Indicator Message
display.reg_sho_short_sale_price_test_restricted_indicator_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Reg Sho Short Sale Price Test Restricted Indicator Message
dissect.reg_sho_short_sale_price_test_restricted_indicator_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Stock: 8 Byte Ascii String
  index = dissect.stock(buffer, index, packet, parent)

  -- Reg Sho Action: 1 Byte Ascii String Enum with 3 values
  index = dissect.reg_sho_action(buffer, index, packet, parent)

  return index
end

-- Dissect: Reg Sho Short Sale Price Test Restricted Indicator Message
dissect.reg_sho_short_sale_price_test_restricted_indicator_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.reg_sho_short_sale_price_test_restricted_indicator_message then
    local range = buffer(offset, 13)
    local display = display.reg_sho_short_sale_price_test_restricted_indicator_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.reg_sho_short_sale_price_test_restricted_indicator_message, range, display)
  end

  return dissect.reg_sho_short_sale_price_test_restricted_indicator_message_fields(buffer, offset, packet, parent)
end

-- Size: Financial Status Indicator
size_of.financial_status_indicator = 1

-- Display: Financial Status Indicator
display.financial_status_indicator = function(value)
  if value == "D" then
    return "Financial Status Indicator: Delinquent (D)"
  end
  if value == "E" then
    return "Financial Status Indicator: Deficient (E)"
  end
  if value == "Q" then
    return "Financial Status Indicator: Bankrupt (Q)"
  end
  if value == "S" then
    return "Financial Status Indicator: Suspended (S)"
  end
  if value == "G" then
    return "Financial Status Indicator: Deficient and Bankrupt (G)"
  end
  if value == "H" then
    return "Financial Status Indicator: Deficient and Delinquent (H)"
  end
  if value == "J" then
    return "Financial Status Indicator: Delinquent and Bankrupt (J)"
  end
  if value == "K" then
    return "Financial Status Indicator: Deficient Delinquent and Bankrupt (K)"
  end

  return "Financial Status Indicator: Unknown("..value..")"
end

-- Dissect: Financial Status Indicator
dissect.financial_status_indicator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.financial_status_indicator)
  local value = range:string()
  local display = display.financial_status_indicator(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.financial_status_indicator, range, value, display)

  return offset + size_of.financial_status_indicator
end

-- Size: Market Category
size_of.market_category = 1

-- Display: Market Category
display.market_category = function(value)
  if value == "N" then
    return "Market Category: Nyse (N)"
  end
  if value == "A" then
    return "Market Category: Amex (A)"
  end
  if value == "P" then
    return "Market Category: Arca (P)"
  end
  if value == "Q" then
    return "Market Category: Nasdaq Gsm (Q)"
  end
  if value == "G" then
    return "Market Category: Nasdaq Gm (G)"
  end
  if value == "G" then
    return "Market Category: Nasdaq Cm (G)"
  end
  if value == "Z" then
    return "Market Category: Bats (Z)"
  end

  return "Market Category: Unknown("..value..")"
end

-- Dissect: Market Category
dissect.market_category = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.market_category)
  local value = range:string()
  local display = display.market_category(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.market_category, range, value, display)

  return offset + size_of.market_category
end

-- Display: Stock Directory Message
display.stock_directory_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Stock Directory Message
dissect.stock_directory_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Stock: 8 Byte Ascii String
  index = dissect.stock(buffer, index, packet, parent)

  -- Market Category: 1 Byte Ascii String Enum with 7 values
  index = dissect.market_category(buffer, index, packet, parent)

  -- Financial Status Indicator: 1 Byte Ascii String Enum with 8 values
  index = dissect.financial_status_indicator(buffer, index, packet, parent)

  return index
end

-- Dissect: Stock Directory Message
dissect.stock_directory_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.stock_directory_message then
    local range = buffer(offset, 14)
    local display = display.stock_directory_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.stock_directory_message, range, display)
  end

  return dissect.stock_directory_message_fields(buffer, offset, packet, parent)
end

-- Size: Event Code
size_of.event_code = 1

-- Display: Event Code
display.event_code = function(value)
  if value == "O" then
    return "Event Code: Start of Messages (O)"
  end
  if value == "S" then
    return "Event Code: Start of System hours (S)"
  end
  if value == "Q" then
    return "Event Code: Start of Market hours (Q)"
  end
  if value == "M" then
    return "Event Code: End of Market hours (M)"
  end
  if value == "E" then
    return "Event Code: End of System hours (E)"
  end
  if value == "C" then
    return "Event Code: End of Message (C)"
  end
  if value == "A" then
    return "Event Code: Halt (A)"
  end
  if value == "R" then
    return "Event Code: Quote Only Period (R)"
  end
  if value == "B" then
    return "Event Code: Resumption (B)"
  end

  return "Event Code: Unknown("..value..")"
end

-- Dissect: Event Code
dissect.event_code = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.event_code)
  local value = range:string()
  local display = display.event_code(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.event_code, range, value, display)

  return offset + size_of.event_code
end

-- Display: System Event Message
display.system_event_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: System Event Message
dissect.system_event_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Event Code: 1 Byte Ascii String Enum with 9 values
  index = dissect.event_code(buffer, index, packet, parent)

  return index
end

-- Dissect: System Event Message
dissect.system_event_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.system_event_message then
    local range = buffer(offset, 5)
    local display = display.system_event_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.system_event_message, range, display)
  end

  return dissect.system_event_message_fields(buffer, offset, packet, parent)
end

-- Size: Second
size_of.second = 4

-- Display: Second
display.second = function(value)
  return "Second: "..value
end

-- Dissect: Second
dissect.second = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.second)
  local value = range:uint()
  local display = display.second(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.second, range, value, display)

  return offset + size_of.second
end

-- Display: Time Stamp Message
display.time_stamp_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Time Stamp Message
dissect.time_stamp_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Second: 4 Byte Unsigned Fixed Width Integer
  index = dissect.second(buffer, index, packet, parent)

  return index
end

-- Dissect: Time Stamp Message
dissect.time_stamp_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.time_stamp_message then
    local range = buffer(offset, 4)
    local display = display.time_stamp_message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.time_stamp_message, range, display)
  end

  return dissect.time_stamp_message_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Payload
size_of.payload = function(buffer, offset, code)
  -- Size of Time Stamp Message
  if code == "T" then
    return 4
  end
  -- Size of System Event Message
  if code == "S" then
    return 5
  end
  -- Size of Stock Directory Message
  if code == "R" then
    return 14
  end
  -- Size of Reg Sho Short Sale Price Test Restricted Indicator Message
  if code == "Y" then
    return 13
  end
  -- Size of Market Participant Position Message
  if code == "L" then
    return 19
  end
  -- Size of Add Order Message
  if code == "A" then
    return 29
  end
  -- Size of Add Order with Mpid Message
  if code == "F" then
    return 33
  end
  -- Size of Order Executed Message
  if code == "E" then
    return 24
  end
  -- Size of Order Executed With Price Message
  if code == "C" then
    return 29
  end
  -- Size of Order Cancel Message
  if code == "X" then
    return 16
  end
  -- Size of Order Delete Message
  if code == "D" then
    return 12
  end
  -- Size of Order Replace Message
  if code == "D" then
    return 28
  end
  -- Size of Trade Message
  if code == "P" then
    return 37
  end
  -- Size of Cross Trade Message
  if code == "Q" then
    return 29
  end
  -- Size of Broken Trade Message
  if code == "B" then
    return 12
  end
  -- Size of Net Order Imbalance Indicator Message
  if code == "I" then
    return 43
  end
  -- Size of Retail Price Improvement Indicator Message
  if code == "N" then
    return 13
  end

  return 0
end

-- Display: Payload
display.payload = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches:
dissect.payload_branches = function(code, buffer, offset, packet, parent)
  -- Dissect Time Stamp Message
  if code == "T" then
    return dissect.time_stamp_message(buffer, offset, packet, parent)
  end
  -- Dissect System Event Message
  if code == "S" then
    return dissect.system_event_message(buffer, offset, packet, parent)
  end
  -- Dissect Stock Directory Message
  if code == "R" then
    return dissect.stock_directory_message(buffer, offset, packet, parent)
  end
  -- Dissect Reg Sho Short Sale Price Test Restricted Indicator Message
  if code == "Y" then
    return dissect.reg_sho_short_sale_price_test_restricted_indicator_message(buffer, offset, packet, parent)
  end
  -- Dissect Market Participant Position Message
  if code == "L" then
    return dissect.market_participant_position_message(buffer, offset, packet, parent)
  end
  -- Dissect Add Order Message
  if code == "A" then
    return dissect.add_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Add Order with Mpid Message
  if code == "F" then
    return dissect.add_order_with_mpid_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Executed Message
  if code == "E" then
    return dissect.order_executed_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Executed With Price Message
  if code == "C" then
    return dissect.order_executed_with_price_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Cancel Message
  if code == "X" then
    return dissect.order_cancel_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Delete Message
  if code == "D" then
    return dissect.order_delete_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Replace Message
  if code == "D" then
    return dissect.order_replace_message(buffer, offset, packet, parent)
  end
  -- Dissect Trade Message
  if code == "P" then
    return dissect.trade_message(buffer, offset, packet, parent)
  end
  -- Dissect Cross Trade Message
  if code == "Q" then
    return dissect.cross_trade_message(buffer, offset, packet, parent)
  end
  -- Dissect Broken Trade Message
  if code == "B" then
    return dissect.broken_trade_message(buffer, offset, packet, parent)
  end
  -- Dissect Net Order Imbalance Indicator Message
  if code == "I" then
    return dissect.net_order_imbalance_indicator_message(buffer, offset, packet, parent)
  end
  -- Dissect Retail Price Improvement Indicator Message
  if code == "N" then
    return dissect.retail_price_improvement_indicator_message(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Payload
dissect.payload = function(buffer, offset, packet, parent)
  -- Parse Payload type dependency
  local code = buffer(offset - 1, 1):string()

  if not show.payload then
    return dissect.payload_branches(code, buffer, offset, packet, parent)
  end

  -- Calculate size and check that branch is not empty
  local size = size_of.payload(buffer, offset, code)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = display.payload(buffer, packet, parent)
  local element = parent:add(nasdaq_totalview_itch_v4_1.fields.payload, range, display)

  return dissect.payload_branches(code, buffer, offset, packet, element)
end

-- Size: Message Type
size_of.message_type = 1

-- Display: Message Type
display.message_type = function(value)
  if value == "T" then
    return "Message Type: Time Stamp Message (T)"
  end
  if value == "S" then
    return "Message Type: System Event Message (S)"
  end
  if value == "R" then
    return "Message Type: Stock Directory Message (R)"
  end
  if value == "Y" then
    return "Message Type: Reg Sho Short Sale Price Test Restricted Indicator Message (Y)"
  end
  if value == "L" then
    return "Message Type: Market Participant Position Message (L)"
  end
  if value == "A" then
    return "Message Type: Add Order Message (A)"
  end
  if value == "F" then
    return "Message Type: Add Order with Mpid Message (F)"
  end
  if value == "E" then
    return "Message Type: Order Executed Message (E)"
  end
  if value == "C" then
    return "Message Type: Order Executed With Price Message (C)"
  end
  if value == "X" then
    return "Message Type: Order Cancel Message (X)"
  end
  if value == "D" then
    return "Message Type: Order Delete Message (D)"
  end
  if value == "D" then
    return "Message Type: Order Replace Message (D)"
  end
  if value == "P" then
    return "Message Type: Trade Message (P)"
  end
  if value == "Q" then
    return "Message Type: Cross Trade Message (Q)"
  end
  if value == "B" then
    return "Message Type: Broken Trade Message (B)"
  end
  if value == "I" then
    return "Message Type: Net Order Imbalance Indicator Message (I)"
  end
  if value == "N" then
    return "Message Type: Retail Price Improvement Indicator Message (N)"
  end

  return "Message Type: Unknown("..value..")"
end

-- Dissect: Message Type
dissect.message_type = function(buffer, offset, packet, parent)
  local length = 1
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.message_type(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.message_type, range, value, display)

  return offset + length, value
end

-- Size: Length
size_of.length = 2

-- Display: Length
display.length = function(value)
  return "Length: "..value
end

-- Dissect: Length
dissect.length = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.length)
  local value = range:uint()
  local display = display.length(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.length, range, value, display)

  return offset + size_of.length
end

-- Display: Message Header
display.message_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message Header
dissect.message_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Length: 2 Byte Unsigned Fixed Width Integer
  index = dissect.length(buffer, index, packet, parent)

  -- Message Type: 1 Byte Ascii String Enum with 17 values
  index = dissect.message_type(buffer, index, packet, parent)

  return index
end

-- Dissect: Message Header
dissect.message_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.message_header then
    local range = buffer(offset, 3)
    local display = display.message_header(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.message_header, range, display)
  end

  return dissect.message_header_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size: Message
size_of.message = function(buffer, offset)
  local index = 0

  index = index + 3

  -- Calculate runtime size of Payload field
  local payload_offset = offset + index
  local payload_type = buffer(payload_offset - 1, 1):string()
  index = index + size_of.payload(buffer, payload_offset, payload_type)

  return index
end

-- Display: Message
display.message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message
dissect.message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Header: Struct of 2 fields
  index = dissect.message_header(buffer, index, packet, parent)

  -- Payload: Runtime Type with 17 branches
  index = dissect.payload(buffer, index, packet, parent)

  return index
end

-- Dissect: Message
dissect.message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.message then
    local length = size_of.message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.message(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.message, range, display)
  end

  return dissect.message_fields(buffer, offset, packet, parent)
end

-- Size: Count
size_of.count = 2

-- Display: Count
display.count = function(value)
  return "Count: "..value
end

-- Dissect: Count
dissect.count = function(buffer, offset, packet, parent)
  local length = 2
  local range = buffer(offset, length)
  local value = range:uint()
  local display = display.count(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.count, range, value, display)

  return offset + length, value
end

-- Size: Sequence
size_of.sequence = 8

-- Display: Sequence
display.sequence = function(value)
  return "Sequence: "..value
end

-- Dissect: Sequence
dissect.sequence = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.sequence)
  local value = range:uint64()
  local display = display.sequence(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.sequence, range, value, display)

  return offset + size_of.sequence
end

-- Size: Session
size_of.session = 10

-- Display: Session
display.session = function(value)
  return "Session: "..value
end

-- Dissect: Session
dissect.session = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.session)
  local value = range:string()
  local display = display.session(value, buffer, offset, packet, parent)

  parent:add(nasdaq_totalview_itch_v4_1.fields.session, range, value, display)

  return offset + size_of.session
end

-- Display: Packet Header
display.packet_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Packet Header
dissect.packet_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Session: 10 Byte Ascii String
  index = dissect.session(buffer, index, packet, parent)

  -- Sequence: 8 Byte Unsigned Fixed Width Integer
  index = dissect.sequence(buffer, index, packet, parent)

  -- Count: 2 Byte Unsigned Fixed Width Integer
  index = dissect.count(buffer, index, packet, parent)

  return index
end

-- Dissect: Packet Header
dissect.packet_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.packet_header then
    local range = buffer(offset, 20)
    local display = display.packet_header(buffer, packet, parent)
    parent = parent:add(nasdaq_totalview_itch_v4_1.fields.packet_header, range, display)
  end

  return dissect.packet_header_fields(buffer, offset, packet, parent)
end

-- Dissect Packet
dissect.packet = function(buffer, packet, parent)
  local index = 0

  -- Packet Header: Struct of 3 fields
  index = dissect.packet_header(buffer, index, packet, parent)

  -- Message: Struct of 2 fields
  while index < buffer:len() do
    index = dissect.message(buffer, index, packet, parent)
  end

  return index
end


-----------------------------------------------------------------------
-- Protocol Dissector and Components
-----------------------------------------------------------------------

-- Initialize Dissector
function nasdaq_totalview_itch_v4_1.init()
end

-- Dissector for Nasdaq TotalView Itch 4.1
function nasdaq_totalview_itch_v4_1.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = nasdaq_totalview_itch_v4_1.name

  -- Dissect protocol
  local protocol = parent:add(nasdaq_totalview_itch_v4_1, buffer(), nasdaq_totalview_itch_v4_1.description, "("..buffer:len().." Bytes)")
  local protocol_size = dissect.packet(buffer, packet, protocol)
end

-- Register With Udp Table
local udp_table = DissectorTable.get("udp.port")
udp_table:add(65333, nasdaq_totalview_itch_v4_1)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.nasdaq_totalview_itch_v4_1_packet_size = function(buffer)

  return true
end

-- Dissector Heuristic for Nasdaq TotalView Itch 4.1
local function nasdaq_totalview_itch_v4_1_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.nasdaq_totalview_itch_v4_1_packet_size(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = nasdaq_totalview_itch_v4_1
  nasdaq_totalview_itch_v4_1.dissector(buffer, packet, parent)

  return true
end

-- Register Nasdaq TotalView Itch 4.1 Heuristic
nasdaq_totalview_itch_v4_1:register_heuristic("udp", nasdaq_totalview_itch_v4_1_heuristic)

-----------------------------------------------------------------------
-- This script was generated by the open markets initiative
-- Lua dissectors are an easily edited and modified cross platform dissection solution.
-- Feel free to modify. Enjoy.
-----------------------------------------------------------------------
-- Protocol:
-- Version: 4.1
-- Date: Thursday, June 12, 2014
-- Script:
-- Source Version: 1.3.0.0
-- Compiler Version: 1.1
-- License: Public/GPLv3
-- Authors: Omi Developers
-----------------------------------------------------------------------
