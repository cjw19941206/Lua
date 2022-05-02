#!C:\Program Files\Lua\5.3.6\bin\lua

print(hello)
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
            table.unpack()
        end
        checkNils(1, nil, 3, nil)
    end
}









for funcName, func in pairs(funcs) do
    print("----------------[" .. funcName .. "]----------------")
    func()
    print("----------------[" .. funcName .. "]----------------\n")
end
