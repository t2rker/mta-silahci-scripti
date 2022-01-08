
local marker = createMarker(-2521.20093, -622.92023, 131.76131, "cylinder", 2,255,255,0,170,true)
    function silahci(komut)
if isElementWithinMarker(localPlayer,marker) then

        GUIEditor = {
            edit = {},
            button = {},
            window = {},
            label = {},
            gridlist = {}
        }
                GUIEditor.window[1] = guiCreateWindow(627, 294, 741, 526, "viablegames.com/mta", false)
                guiWindowSetSizable(GUIEditor.window[1], false)
                guiSetVisible(GUIEditor.window[1],true)
                showCursor(guiGetVisible(GUIEditor.window[1]))
        
                GUIEditor.label[1] = guiCreateLabel(257, 33, 204, 72, "Silahçı", false, GUIEditor.window[1])
                guiSetFont(GUIEditor.label[1], "sa-header")
                GUIEditor.gridlist[1] = guiCreateGridList(26, 150, 459, 307, false, GUIEditor.window[1])
                GUIEditor.button[1] = guiCreateButton(519, 353, 150, 80, "Satın al", false, GUIEditor.window[1])
                GUIEditor.button[2] = guiCreateButton(660, 40, 60, 25, "KAPAT", false, GUIEditor.window[1])
                GUIEditor.edit[1] = guiCreateEdit(518, 260, 150, 30, "Mermi sayısı",false, GUIEditor.window[1])  
                
            addEventHandler("onClientGUIClick", root, function()
            if source==GUIEditor.edit[1] then
                guiSetText(GUIEditor.edit[1], "")
            end 
            if source==GUIEditor.button[2] then
                guiSetVisible(GUIEditor.window[1],false)
                showCursor(false)
            end
            end)
        
            guiGridListAddColumn(GUIEditor.gridlist[1], "Silah adı", 0.2)
            guiGridListAddColumn(GUIEditor.gridlist[1], "ID", 0.2)
            guiGridListAddColumn(GUIEditor.gridlist[1], "Fiyatı", 0.2)
            guiGridListAddColumn(GUIEditor.gridlist[1], "Mermi fiyatı", 0.2)
            Silahlar={
                {"COLT-45", 22, 10000, 7},
                {"Uzi", 28, 20000, 8},
                {"Pompalı", 25, 25000, 15},
                {"MP-5", 29, 30000, 9},
                {"AK-47", 30, 40000, 10},
                {"M4", 31, 50000, 11},
                {"Sniper", 34, 60000, 20}
            }
        
            for i,data in pairs(Silahlar) do
               local rowID = guiGridListAddRow(GUIEditor.gridlist[1])
                guiGridListSetItemText(GUIEditor.gridlist[1], rowID, 1, data[1], false, false)
                guiGridListSetItemText(GUIEditor.gridlist[1], rowID, 2, data[2], false, false)
                guiGridListSetItemText(GUIEditor.gridlist[1], rowID, 3, data[3], false, false)
                guiGridListSetItemText(GUIEditor.gridlist[1], rowID, 4, data[4], false, false)
                guiGridListSetItemText(GUIEditor.gridlist[1], rowID, 5, data[5], false, false)
                guiGridListSetItemText(GUIEditor.gridlist[1], rowID, 6, data[6], false, false)
                guiGridListSetItemText(GUIEditor.gridlist[1], rowID, 7, data[7], false, false)
                guiGridListSetSortingEnabled(GUIEditor.gridlist[1], false)
            end
            
            addEventHandler("onClientGUIClick", root, function()
            if source == GUIEditor.button[1] then
                   local secilmisSilahlar = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
                   local isim = guiGridListGetItemText (GUIEditor.gridlist[1], secilmisSilahlar, 1)
                   local id = guiGridListGetItemText (GUIEditor.gridlist[1], secilmisSilahlar, 2)
                   local fiyat = guiGridListGetItemText (GUIEditor.gridlist[1], secilmisSilahlar, 3)
                   local m_fiyat = guiGridListGetItemText (GUIEditor.gridlist[1], secilmisSilahlar, 4)
                   local mermi = guiGetText(GUIEditor.edit[1])
        
                   if isim and id and fiyat and m_fiyat and mermi then
                      triggerServerEvent("silah:satinAl", localPlayer, isim,id,fiyat,mermi,m_fiyat)
                   end
                end
            end)
        end
    end
addCommandHandler("silahci",silahci)       

