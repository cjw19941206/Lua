#!C:\Program Files\Lua\5.3.6\bin\lua

print("1 + 1 --> ", 1 + 1)
print("1.0 + 1.0 --> ", 1.0 + 1.0)
print("1 + 1.0 --> ", 1 + 1.0)
print("5 / 2 --> ",5 / 2)
print("5.0 / 2 -->", 5.0 / 2)
print("5 // 2 -->", 5.0 / 2)
print("5.0 // 2 -->", 5.0 / 2)
print("4.0 / 2.0 -->", 5.0 / 2)
print("3.1415 - 3.1415 % 0.01 --> ", 3.1415 - 3.1415 % 0.01)
print("2 ^ 3 -->", 2 ^ 3)
print("2 ^ 3.1 -->", 2 ^ 3.1)
print("8 ^ (1 / 3) -->", 8 ^  (1 / 3))

print(2^53)
print(math.maxinteger + 0.0)
print(-math.mininteger)
print(#"长城")
print(1 .. 2)

page = [[
<html>
<head>
	<title> An HTML Page </title>
</head>
...
]]

print(page)

print(tonumber(" -3e"))
print(tonumber(" -3e1"))
print(tonumber("fff", 16))
print(tonumber("987", 8))
print(tostring(12))
print(tostring(12) == "12")

print(2 < 15)
print("2" < "15")
--print(2 < "15")

for i, c in utf8.char("长城123dsf") do
    print(i, c)
end


