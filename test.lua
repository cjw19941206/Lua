#!C:\Program Files\Lua\5.3.6\bin\lua

local inspect = require("inspect")

funcs = {
    ["tableCtor"]
    =
    function ()
        local t = {[1]="a", ["a"] = 1}
        t[2] = "b"
        t["b"] = 2
        print(t[1], t[2])
        print(t["a"], t.b)
        t[1] = "A"
        t.a = "一"
        print(t[1], t[2])
        print(t["a"], t.b)
        t[2] = nil
        t["b"] = nil
        print(t[1], t[2])
        print(t["a"], t.b)
    end,

    ["tableIndex"]
    =
    function ()
        local t = {}
        t[2.0] = 10
        t[2.1] = 20
        print(t[2])
        print(t[2.0])
        print(t[2.1])
    end,

    ["tableLen"]
    =
    function ()
        local t = {"a"}
        print(#t)
        t[2] = 1000
        print(#t)
        t["a"] = nil
        for k, v in pairs(t) do
            print(k, v)
        end
    end,

    ["tableIter"]
    =
    function ()
        local t = {"a", "b", [3]=nil, [4]="d"}
        for k, v in ipairs(t) do
            print(k, v)
        end
    end,

    ["funcMultiRetVal"]
    =
    function()
        local function foo()  end
        local function foo1() return foo(), 1  end
        local function foo2() return 1, foo()  end
        local x, y = foo(), 20, 30
        print(x, y)
        print(foo(), 1)
        print(1, foo())
        --print( foo() .. "e")
        print(foo())
        print((foo()))
        print(foo1())
        local a, b, c = foo2(), 10, 11, 12
        print(a, b, c)
    end,

    ["funcVariableArgs"]
    =
    function()
        local function checkNils(...)
            print(#{...})
            for k, v in pairs({...}) do
                print(k, v)
            end

            local variableArgs = table.pack(...)
            for k, v in pairs(variableArgs) do
                print(k, v)
            end
            for i = 1, variableArgs.n do
                print(i, variableArgs[i])
            end

            print(select(1, ...))
            print(select(2, ...))
            print(select("#", ...))


            local a, b, c = ..., "hello"
            print(a, b, c)
            local x, y, z = "world", ...
            print(x, y, z)
        end
        checkNils(1, nil, 3, nil)
    end,

    ["controlRules"]
    =
    function()
        ----local i = 0
        --
        --if i == 0 then
        --    print(i)
        --elseif i == 1 then
        --    print(i + 1)
        --else
        --    print(i - 1)
        --end


        local x = 10
        local sqr = x / 2
        repeat
            sqr = (sqr + x / sqr) / 2
            local error = math.abs(sqr ^ 2 - x)
        until error < x / 1000
    end,

    ["funcClosePackage"]
    =
    function()
        function newCounter()
            local x = 0
            return function()
                x = x + 1
                return x
            end
        end

        local c1 = newCounter()
        local c2 = newCounter()
        print(c1())
        print(c1())
        print(c2())
        print(c1())
        print(c2())
    end,

    ["dataDesc"]
    =
    function()
        local count = 0
        function Entry()
            count = count + 1
        end
        dofile("./data.lua")
        print(count)
    end,

    ["load"]
    =
    function()
        print("enter your expression: ")
        local line = io.read()
        local func = assert(load("return " .. line))
        print("the value of your expression is " .. func())
    end,

    ["errorHandler"]
    =
    function()
        function f2()
            error("error in f2", 2)
        end

        function f1()
            return f2()
        end
        math = require("math")
        math.sin(1)
        local ok, msg = pcall(f1)
        print("==========pcall==========\n" .. msg .. "\n==========pcall==========\n")

        local ok, msg = xpcall(f1, function(x) return tostring(x+ 1) end, 1)
        print("==========xpcall==========\n" .. msg .. "\n==========xpcall==========\n")
    end,

    ["package"]
    =
    function()
        print(package.path)
        print(package.cpath)

    end


}

function f2()
    error("error in f2", 2)
end

function f1()
    return f2()
end
math = require("math")
math.sin(1)
local ok, msg = pcall(f1)
print("==========pcall==========\n" .. msg .. "\n==========pcall==========\n")

local ok, msg = xpcall(f1, function(x) return tostring(x+ 1) end, 1)
print("==========xpcall==========\n" .. msg .. "\n==========xpcall==========\n")

for funcName, func in pairs(funcs) do
    print("----------------[" .. funcName .. "]----------------")
    func()
    print("----------------[" .. funcName .. "]----------------\n")
end
