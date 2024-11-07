---@diagnostic disable
--- parsing expression grammar


::except_some::
--- any without some
---@param patt string
lpeg.P(1)^0 - patt
