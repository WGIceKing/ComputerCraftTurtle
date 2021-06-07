local ws, error = http.websocket("ws://localhost:5757")
if ws then
    ws.send("Hello im a turtle")
    print(ws.receive())
    ws.close()
end    