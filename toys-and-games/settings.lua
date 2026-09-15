data:extend({
  {
    type = "string-setting",
    setting_type = "startup",
    name = "tg-sink-mode",
    default_value = "orders",
    allowed_values = { "orders", "leisure-science", "both" },
    order = "a[toys-and-games]-a[sink]"
  }
})
