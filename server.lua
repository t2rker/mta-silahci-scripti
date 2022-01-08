addEvent("silah:satinAl", true)
addEventHandler("silah:satinAl", root, function(isim,id,fiyat,mermi,m_fiyat)
    oyuncuPara = getPlayerMoney(source)
    gerekenPara = fiyat+mermi*m_fiyat
    if oyuncuPara <= gerekenPara then
        outputChatBox("[Silahçı]#FFFFFF Paran yok dostum hadi ikile!", source, 255,0,0, true)
        return end
    if (mermi ~= "") and (mermi ~= nil) and (mermi ~= " ") then
        giveWeapon(source, id, mermi, true)
        takePlayerMoney(source, gerekenPara)
        outputChatBox("[Silahçı]#FFFFFF"..isim.." adlı silahı satın aldın. Ödediğin fiyat: "..gerekenPara, source, 0,255,0, true)
    else
        outputChatBox("[Silahçı]#FFFFFF İstediğin mermi miktarını doğru gir!", source, 255,0,0, true)
        return
    end
end)



