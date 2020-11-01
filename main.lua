--[[
GAME LINK https://www.roblox.com/games/4616652839/TEN-TAILS-Shinobi-Life-2
v3rm: https://v3rmillion.net/showthread.php?tid=1063031
Discord: reav#2966
Discord Server: https://discord.gg/aDRStgw
Usage:
loadstring(game:HttpGet("https://raw.githubusercontent.com/reavscripts/sl2_autofarm/main/main.lua", true))()
]]

repeat wait() until game:IsLoaded()
--old-antitp bypass
if workspace:FindFirstChild("CCoff") then
    game:GetService("Workspace").CCoff:Destroy()
end
--antiafk
local VirtualUser=game:service'VirtualUser'
	game:service'Players'.LocalPlayer.Idled:connect(function()
	warn("anti-afk")
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)
--variables
local player = game.Players.LocalPlayer
local mission = player.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory")
local menuplace = 4616652839
local forestplace = 5447073001
local rainplace = 5084678830
local trainingplace = 5431071837
local akatsukiplace = 5431069982
local villageplace = game:GetService("Workspace"):FindFirstChild("rank")
local warplace = game:GetService("Workspace"):FindFirstChild("warmode")
function toTarget(pos, targetPos, targetCFrame)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/getgenv().speed, Enum.EasingStyle.Linear)
    local tween, err = pcall(function()
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(90))})
        tween:Play()
    end)
    if not tween then return err end
end

--loading wally ui revamped By Aika
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
_G.ButtonColor = Color3.fromRGB(5, 16, 20);
_G.ButtonTextColor = Color3.fromRGB(247, 95, 28);
_G.PointerColor = Color3.fromRGB(247, 95, 28);
_G.SecondaryColor = Color3.fromRGB(0, 102, 255);
_G.TertiaryColor = Color3.fromRGB(5, 16, 20);
_G.ToggleColor = Color3.fromRGB(247, 95, 28);
_G.MainTextColor = Color3.fromRGB(255, 255, 255);
_G.MainColor = Color3.fromRGB(247, 95, 28);
_G.SliderColor = Color3.fromRGB(247, 95, 28);
getgenv().speed = 500
local w = library:CreateWindow("Shinobi Life 2")
if villageplace or game.PlaceId == trainingplace or game.PlaceId == rainplace or game.PlaceId == akatsukiplace or game.PlaceId == forestplace then
	--AUTOFARM
	local b = w:CreateFolder("AutoFarm")
	b:Label("To prevent issues farm in a ps",{
		TextSize = 16;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
	local autofarm
	b:Toggle("AutoFarm",function(bool)
		autofarm = bool
	end)
	local candies
	b:Toggle("Farm candies",function(bool)
		candies = bool
	end)
	local speed
	b:Slider("Tween Speed",{
		min = 500; 
		max = 2500;
		precise = false;
		},function(speed)
		getgenv().speed = speed
	end)
	local scrollfarm
	b:Toggle("Scroll Sniper",function(bool)
		scrollfarm = bool
	end)
	local jinfarm
	b:Toggle("JinFarm (instakill)",function(bool)
		jinfarm = bool
	end)
	local RANKUP
	b:Toggle("AutoRank",function(bool)
		RANKUP = bool
	end)

	local d = w:CreateFolder("Quests Maker")
	d:Button("Rushs",function()
		for i = 1,300 do
			game.Players.LocalPlayer.Character.combat.update:FireServer("rushw")
			wait(.25)
		end
	end)
	d:Button("Jumps",function()
		for v = 1,300 do
			game.Players.LocalPlayer.Character.combat.update:FireServer("takemovement2")
			wait(.25)
		end
	end)
	d:Button("Chakra Charges",function()
		for i = 1,500 do
			game.Players.LocalPlayer.Character.combat.update:FireServer("key","c")
			wait(.1)
			game.Players.LocalPlayer.Character.combat.update:FireServer("key","cend")
			wait(.5)
		end
	end)
	d:Button("Punches",function()
		for i = 1,999 do
			game.Players.LocalPlayer.Character.combat.update:FireServer("mouse1",true)
			wait(.3)
		end
	end)
	d:Button("TP TrainLog",function()
		toTarget(player.Character.HumanoidRootPart.Position,workspace.npc.logtraining:FindFirstChild("HumanoidRootPart").Position,CFrame.new(game:GetService("Workspace").npc.logtraining:FindFirstChild("HumanoidRootPart").Position))
	end)

	game:GetService('RunService').Stepped:connect(function()
		if autofarm or candies then
			pcall(function()
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end)
		end
	end)
	local green = "http://www.roblox.com/asset/?id=5459241648"
	local red = "http://www.roblox.com/asset/?id=5459241799"
	local candy = "http://www.roblox.com/asset/?id=5710748193"
	spawn(function()
		while wait() do
			if autofarm then
				if  player.currentmission.Value == nil then
					for i,v in pairs(workspace.missiongivers:GetChildren()) do
						pcall(function()
							if player.currentmission.Value == nil and v.Name == "" and v:FindFirstChild("Head") and v.Head:FindFirstChild("givemission").Enabled and v.Head.givemission:FindFirstChild("color").Visible  then
								local TALK = v:FindFirstChild("Talk")
								local lvl = player.statz.lvl.lvl.Value
								if lvl <= 699 then
									if player.currentmission.Value == nil  and v.Talk:FindFirstChild("typ").Value == "defeat" and v.Head.givemission.Enabled and v.Head.givemission.color.Visible and v.Head.givemission.color.Image == green then
										local getmission = v:FindFirstChild("HumanoidRootPart")
										local clienttalk = v:FindFirstChild("CLIENTTALK")
										repeat wait(.3)
											toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
											if (player.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 10 then
												clienttalk:FireServer()
												wait(.3)
												clienttalk:FireServer("accept")
											end
										until mission.Visible or v:FindFirstChild("Head").givemission.Enabled == false or player.currentmission.Value == "mission" or not autofarm
									end
								elseif lvl >= 700 then
									if player.currentmission.Value == nil and TALK.typ.Value == "defeat" and v.Head.givemission.Enabled and v.Head.givemission.color.Visible and v.Head.givemission.color.Image == green or v.Head.givemission.color.Image == red then
										local getmission = v:FindFirstChild("HumanoidRootPart")
										local clienttalk = v:FindFirstChild("CLIENTTALK")
										repeat wait(.3)
											toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
											if (player.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 10 then
												clienttalk:FireServer()
												wait(.3)
												clienttalk:FireServer("accept")
											end
										until mission.Visible or v:FindFirstChild("Head").givemission.Enabled == false or player.currentmission.Value == "mission" or not autofarm
									end
								end
							end
						end)
					end
				else
					for i,v in pairs(workspace.npc:GetChildren()) do
						pcall(function()
						    if v.ClassName == "Model" and v:FindFirstChild("npctype") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 then
								repeat wait(.3)
									toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
									v.Humanoid.Health = 0
								until v.Humanoid.Health == 0 or not autofarm or player.currentmission.Value == nil
							end
						end)
					end
				end
			end
		end
	end)
	spawn(function()
		while wait() do
			if candies then
				local spins = player.statz.spins.Value
				if spins < 500 then
					for i,v in pairs(workspace.missiongivers:GetChildren()) do
						pcall(function()
							if mission.Visible == false and v.ClassName == "Model" and v:FindFirstChild("Head"):FindFirstChild("givemission").Enabled and v:FindFirstChild("CLIENTTALK") and v:FindFirstChild("Talk") and string.find(v.Talk.talk1.Value, "TRICK OR TREAT") and v.Talk:FindFirstChild("typ").Value == "halloweenevent" and v.Head.givemission.color.Image == candy then
								repeat wait(.3)
									toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-5,0)))
									v.CLIENTTALK:FireServer()
									wait(.2)
									v.CLIENTTALK:FireServer("accept")
								until v:FindFirstChild("Head").givemission.Enabled == false or not candies
							end
						end)
					end
				else
					print("max spins reached 500")
				end
			end
		end
	end)
	local function SCROLLFARM()
		for i,v in pairs(game.workspace.GLOBALTIME:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and v.sh.Position.Y < 2000 then
				local scrollA = v.sh:FindFirstChild("invoke")
				print("SCROLL SPAWNED")
				pcall(function()
					toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
				end)
				scrollA:FireServer(game.Players.LocalPlayer)
				fireclickdetector(v.sh.ClickDetector)
			end
		end
	end
	local function SCROLLFARM1()
		for i,v in pairs(game.workspace:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and v.sh.Position.Y < 2000 then
				local scrollA = v.sh:FindFirstChild("invoke")
				print("SCROLL SPAWNED in workspace")
				pcall(function()
					toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
					scrollA:FireServer(game.Players.LocalPlayer)
					fireclickdetector(v.sh.ClickDetector)
				end)
			end
		end
	end
	spawn(function()
		while wait() do
			if scrollfarm then
				repeat wait()
					SCROLLFARM()
					SCROLLFARM1()
				until not scrollfarm or not war or not war2
			end
		end
	end)
	local function JINFARM()
		for i,v in pairs(game:GetService("Workspace").npc:GetChildren()) do
			if v.Name == "npc1" then
				repeat wait()
					pcall(function()
						toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-25,0)))
						player.Character.combat.update:FireServer("mouse1", true)
						wait(.1)
						v.Humanoid.HealthChanged:Connect(function()
    						v.Humanoid.Health = 0
    					end)
					end)
				until v.Humanoid.Health == 0 or not jinfarm
			end
		end
	end
	spawn(function()
		while wait() do
			if jinfarm then
				JINFARM()
			end
		end
	end)
	spawn(function()
		while wait() do
			if RANKUP and player.statz.lvl:FindFirstChild("lvl").Value == 1000 then
				repeat wait()
					game.Players.LocalPlayer.startevent:FireServer("rankup")
				until player.statz.lvl:FindFirstChild("lvl").Value == 1 or not RANKUP
			end
		end
	end)
end
if villageplace or game.PlaceId == trainingplace or game.PlaceId == rainplace or game.PlaceId == akatsukiplace or game.PlaceId == forestplace then
    local g = w:CreateFolder("Infinite Mode")
	g:Label("Enable your mode and setup when charge chakra (not max)",{
		TextSize = 15;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
    local when = 100000
    g:Slider("When charge chakra",{
        min = 30000; 
        max = 200000; 
        precise = false;
    },function(z)
        when = z
    end)    
    g:Button("InfiniteMode",function()
        local mode = game.Players.LocalPlayer.Character.combat.mode
        local copy = mode:Clone()
        copy.Parent = mode.Parent
        mode:Destroy()
        local chakra = string.split(game.Players.LocalPlayer.PlayerGui.Main.ingamearena.Bar.cha.Text,"CHA: ")[2]
        c = chakra:gsub("CHA%:","")
        local cha
        local function chakracheck()
            chakra = string.split(game.Players.LocalPlayer.PlayerGui.Main.ingamearena.Bar.cha.Text,"CHA: ")[2]
            c = chakra:gsub("CHA%:","")
            cha = c
        end
        spawn(function() 
            while wait() do
                if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 0 then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
                end
                chakracheck()
            end
        end)
        spawn(function() 
            while wait() do
                if tonumber(cha) < tonumber(when) then
                    game.Players.LocalPlayer.Character.combat.update:FireServer("key","c")
                else
                    game.Players.LocalPlayer.Character.combat.update:FireServer("key","cend")
                end
            end
        end)
    end)
	g:Label("Reset character to disable",{
		TextSize = 18;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
end
if villageplace or game.PlaceId == trainingplace or game.PlaceId == rainplace or game.PlaceId == akatsukiplace or game.PlaceId == forestplace then
    local h = w:CreateFolder("Auto Chakra")
	h:Label("Setup when charge chakra (also max)",{
		TextSize = 16;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
    local infchakra
    h:Toggle("Charge Chakra+Move",function(bool)
    	infchakra = bool
    end)
    local when = 100000
    h:Slider("When charge chakra",{
        min = 30000; 
        max = 250000; 
        precise = false;
    },function(z)
        when = z
    end)    
    spawn(function()
        while wait() do
            if infchakra then
                local chakra = string.split(game.Players.LocalPlayer.PlayerGui.Main.ingamearena.Bar.cha.Text,"CHA: ")[2]
                c = chakra:gsub("CHA%:","")
                local cha
                local function chakracheck()
                    chakra = string.split(game.Players.LocalPlayer.PlayerGui.Main.ingamearena.Bar.cha.Text,"CHA: ")[2]
                    c = chakra:gsub("CHA%:","")
                    cha = c
                end
                spawn(function() 
                    while wait() do
                        if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 0 then
                            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
                        end
                        chakracheck()
                    end
                end)
                spawn(function() 
                    while wait() do
                        if tonumber(cha) < tonumber(when) then
                            game.Players.LocalPlayer.Character.combat.update:FireServer("key","c")
                        else
                            game.Players.LocalPlayer.Character.combat.update:FireServer("key","cend")
                        end
                    end
                end)
            end
        end
    end)
end
if warplace then
	--WAR
	local c = w:CreateFolder("War Farm")
	c:Label("Snipe is built-in",{
		TextSize = 24;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
	local war 
	c:Toggle("WarMode No Tween",function(bool)
		war = bool
	end)
	local war2
	c:Toggle("WarMode Tween (multple players)",function(bool)
		war2 = bool
	end)

	c:Slider("Tween Speed",{
		min = 500; 
		max = 2500;
		precise = false;
		},function(speed)
		getgenv().speed = speed
	end)
	local reset
	c:Toggle("Reset after round 21",function(bool)
		reset = bool
	end)
	--Suggested by Moddi#2715
	local refresh = c:Label("ROUND COUNTER",{
		TextSize = 24;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
	local count = 0
	local refreshC = c:Label("10TAILS COUNTER",{
		TextSize = 24;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
	game:GetService('RunService').Stepped:connect(function()
		if war or war2 then
			pcall(function()
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end)
		end
	end)
	local function SCROLLFARM()
		for i,v in pairs(game.workspace.GLOBALTIME:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and v.sh.Position.Y < 2000 then
				local scrollA = v.sh:FindFirstChild("invoke")
				print("SCROLL SPAWNED")
				pcall(function()
					toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
				end)
				scrollA:FireServer(game.Players.LocalPlayer)
				fireclickdetector(v.sh.ClickDetector)
			end
		end
	end
	local function SCROLLFARM1()
		for i,v in pairs(game.workspace:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and v.sh.Position.Y < 2000 then
				local scrollA = v.sh:FindFirstChild("invoke")
				print("SCROLL SPAWNED in workspace")
				pcall(function()
					toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
					scrollA:FireServer(game.Players.LocalPlayer)
					fireclickdetector(v.sh.ClickDetector)
				end)
			end
		end
	end
	spawn(function()
		while wait() do
			if war or war2 then
				repeat wait()
					SCROLLFARM()
					SCROLLFARM1()
				until not scrollfarm or not war or not war2
			end
		end
	end)
	spawn(function()
		while wait() do
			if war then
				pcall(function()
					refresh:Refresh("War Completed: " .. count)
					refreshC:Refresh("Round: " .. workspace.warserver.round.Value)
				end)
				for i,v in pairs(workspace.npc:GetChildren()) do
					if workspace.warserver:FindFirstChild("zetsu").Value > 0 and string.find(workspace.warserver.text.Value, "Left") or string.find(workspace.warserver.text.Value, "DEFEAT") and v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and not v:FindFirstChild("megaboss") then
						wait(.2)
						pcall(function()
							v.Humanoid.Health = 0
						end)
					elseif v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and v:FindFirstChild("megaboss") then
						wait(6)
						pcall(function()
							toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position))
							v.Humanoid.Health = 0
						end)
					end
				end
				if reset then
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v.Name == "warserver" and v:FindFirstChild("round").Value > 20 then
							wait(5)
							player.Character:BreakJoints()
							repeat wait()
							until v.round.Value == 0
							count = count + 1
						end
					end
				end
			end
		end
	end)
	spawn(function()
		while wait() do
			if war2 then
				refresh:Refresh("War Completed: " .. count)
				refreshC:Refresh("Round: " .. workspace.warserver.round.Value)
				for i,v in pairs(workspace.npc:GetChildren()) do
					if workspace.warserver:FindFirstChild("zetsu").Value > 0 and string.find(workspace.warserver.text.Value, "Left") or string.find(workspace.warserver.text.Value, "DEFEAT") and v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and not v:FindFirstChild("megaboss") then
						pcall(function()
							repeat wait()
							toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-12,0)))
							wait(.3)
							v.Humanoid.Health = 0
							until v.Humanoid.Health == 0
						end)
					elseif v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and v:FindFirstChild("megaboss") then
						wait(8)
						pcall(function()
							toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-25,0)))
							v.Humanoid.Health = 0
						end)
					else
						wait()
					end
				end
				if reset then
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v.Name == "warserver" and v:FindFirstChild("round").Value > 20 then
							wait(5)
							player.Character:BreakJoints()
							repeat wait()
							until v.round.Value == 0
							count = count + 1
						end
					end
				end
			end
		end
	end)
end
local r=string.byte;local t=string.char;local c=string.sub;local L=table.concat;local Q=math.ldexp;local s=getfenv or function()return _ENV end;local M=setmetatable;local P=select;local f=unpack;local i=tonumber;local function X(f)local o,e,n="","",{}local a=256;local d={}for l=0,a-1 do d[l]=t(l)end;local l=1;local function r()local o=i(c(f,l,l),36)l=l+1;local e=i(c(f,l,l+o-1),36)l=l+o;return e end;o=t(r())n[1]=o;while l<#f do local l=r()if d[l]then e=d[l]else e=o..c(o,1,1)end;d[a]=o..c(e,1,1)n[#n+1],o,a=e,e,a+1 end;return table.concat(n)end;local a=X('25K26X27526Z26W27526X23Y26Z26T27925623V24C24823X24C25B24624524D24C23V26Z27127925024023U24A26Z26Y27925724623L26Z26V27924T24C24524C23T24623V23X26123X24626124P24Q26Z27327923U23X23V24024724E26Z27027925124824B28826Z26827924424827O26124B23K26127G24823Z26225N25C25R25R26123P26123Z27P26125P26Z26P28624C23L23X24Q24023N24C2792A025Z25526Z26O29S29U25627M28C28L27E2A923V25M26Z27227924F23V24624424R25A2572A02751P2462A32AH27525724E2A824528C2AQ26X1P2472552B221L24U2B62B225H2A326B27924123X23X23T23U25F25Y25Y24D27V24A28C24D25Z24E24E25Y24825924R24Q23X24E23Y2B226X25K2A328M2AW23W2BH24624726Z26G2AC23T2992592BP2BR26125128R24227R27924E24824424C2AG27924P24524824A24C24W24D2A429324C24723W23T2CZ2D126Z26R27924R24C23U24C29V23T28R23U28U27923T24824023V2DN2DE27525A2DJ24Q27P23Z2402DC2CF2752DG2DA2E227I24C24D2C028C24824E2CV29R2752482452452432CA23U23W26Z26Q2792DX23X25624124027N27G2CD28527525B28R24D2F32DT2EU2EW27N26Z26Z27924Y25A2DO27523X28Y2892AB2752DM27P23X2CQ2752532CT2CV2642792DZ28924A28E23X24124C2612FE26123U2B028E23K24623W26123Y2482472G028H24A2412GF2EF26Z26027E2412462462DI2612GA23W23V26124224E23U2612GF24D26123T27G23U2H124Q24P24W2532G42FF2EH26X2592AK23T24D24623Y2CD2AV26X2G524Q25125224T27Y2792GZ25K2HW2752GZ25N2I026X2GZ2AF27Z2I124E29P26H27924U24X25424T26125925226124G25224S26124U2542532HV26L27925K2612HA2HC26125825425624X26125K25L2IX25825625Z25Z2C425P2A326S2FW2FI28D2IX2DL2472HE2842DF2DH2DJ2JK28R26125325224U2DV26X2C826X2FQ26X2CS2CU2CW2752CY24823K27P2DN2ER27525124624A2EJ2K82KA27Q2JY28O24828D24C29M2GG2DD2792F624C2DZ23V29M27Q2E426X27J28928B28D28G2H624023Z2E92A026W2A527524N26P191621O2EH24M26P26126X21F2LL26P25L2LP2LR2B62LQ2752LM24P2LU27524V25L2LI21F2LT2HQ27921F27924M2612IC21F2LO26X24I2EH2LX2K127927C28N2DJ24A24524023T24B2462KO2D42BE2752BG2BI2BK2BM2BO27W2BR2BT2BV2BX2BZ2C12C32A027S27524J2LH161Q2EH24N26H2LI22Q2IC2MH26H2IC1X2NP2MI27521P2EH2HG2K22K42CV2HP2KJ2KB2EQ28W2KG2KI2CZ2KK2FG26X2KN23X23N2K229428R2JO2F22F42F628O2EV2EX2D428V2M22EJ23W2CV2OS26X2L82GG2LC2IU27524I27922V2792LG2M52LR2LO2MK2LM2LT2PC26P2LW2LR2M02PF2492M126X24U2M92MB2692PB2692LY2MJ2LR2752PF23T2PM24M2NP21F2NP24N2552M52BA24Q2PV2LY2NR2LP2Q42Q61621F2Q82Q22NP2Q12ME2NU2QA2ML2762OX2OZ2FP2JY2FX24C2FZ2EA25F2MG27526W2HP2P816192EH24R2NM2QG2NP2PO2PX2FW26H2PE2QK2QC2Q32P32PP2P32QO2FC2QQ2DP28Q2KS2QU2882QW27J24D2QZ2LC2R32NH2R62E52R92RJ2PN2RL26X24Q2RF2QD2QB2QM2RK2RD2RM2PX2EH2RO2K12QR2RR2QT2FW2RU2QX2RX2R026X2R22P72S12R72S42RB2S72S92RG2SC2SB2MH2S72NV2PM2SJ2OC2QS2KT2752QV2SQ2RY2792SU2LF2SW2S32M52SZ2SF2S82SA2S52QL2T42P42TO2T72MK2T92SL28R2SN2TD2SP2RW2TG2R12S02LI2S226X2R82TM2752RC2LP2RE2T226X2TS2S52TU2UF2SG2PM2LE2SK2RQ2U02CE2IV2IX2HB2HD2J12J32J525L24Q2J92O02FT2K626X2O42DT2O62KE2O82452V82OC2OE2OG2OX23U2JL2DN2OX24V2OU2OW28N2DQ2HN2SJ2L12TA2DR2V92NE2K32V52JY2ET2KX2E12E32JP2E72KH2RW2EC23V2EE2EG2792EJ2EL2EN2EP2KD26X2ET2OP2EY2D72OK26X2F32472F52DS2OO2F92D42SJ2FE29Q27924W2472KN2472DC2I826X24724C27B2WJ2C02RR24E2VN2452OV2K22FS2K52K024P2KO2D72FP2O32OA2O52WJ2KF2KH2VD2XS27Q2VI2FI2OF2VA2K32D72422DR28929M2452AQ26E2792NG2LI22T2NK2SY2PU2PE2EH24V2612M52MG24M2PR2LP2PT2UI26P2PJ2LR2PL2PC2QJ2RK2LW27924G2352M523526X23D2IK2PZ2102MG25B2QF22Q2BA2522YR23H2YT25126P2IC1O29R23D24G27922P2752ZR24H2LI22P24H2Z825324X2LI1Q24X27525225T22H26X23425T2AW2ZX2QG310026X25226H2PB2NP25626121L2LP2MG2522492YY2PL26X2572YI26X25625L1P2LP2M7311019311327531102ST2M6311825L26H26W311B310I2412YY2412RK2LO2Z727524G24H16162ZZ1623Q2T72NX27526K2MM2VY2GE24023X2C42762VY2O12V62V82KC2O72XW2VE2Y027I2VH2VQ2DM2OC2XG2XI2KM2JI27J2KR2U12WQ2DS2KW2E027P2K22VJ28R2C42652A32TZ2KS2HG24R27M2892SR2WP24G2GB2612GK29M26124E24623X2QZ2FL2OY2XY2V62592DH28P24623K2TC2WK2DY2E02E22CV26U29S2L428C29V313X2DC2HG287314228D31292DB2D224D2AQ24V2YD2NH2NJ2RM2LO1J2EH24H2ZN26X2ZP2Z82ZS2752ZU314S23L1B311S28323D2UL1L2CX2EH21E2ZQ314T26X314V2ZR1P18311S1P26W23D24J26931042YT2P42B62122792P42PJ315P26X2YY315S2PZ2MA2RK23D2UM2T52TV2Z02T5315Z315X2MH2QO2TW2LL2YT21F2YT24H24X2CF21F24X315G24G255315D22P255315G2T71L2LL2MG1L2MG314O2IC21331572ZT2ZV24G269316M269316P2EH316R2LY310D26X1L317A31002CF1F2ST2ZR112ZY112Z8316Q2LL2M71L2M7316W26X316Y314S3170314S2152ZY215317M31772LL25D2751L318426X24H21T2IC1F21T314S2212ZY221317M2NP1L2NU2Z826X15315P2QO315I2M5315L26X2Z22RK315R2RK22X31602P4310A316624R310F21F310H2B92PX2BA24I2MD310Q2NF2NH2MK24N2492M5310V24I2RI2NU31632P43165318P2SH2NF2412M5311K26X24N23T2M52PZ2S82QO2LM2PB2EH319L2SD26X24G11142QG31AB23Q24J319U2NI319W24N23L2LI1G23L2TD31A32LN2PM31A72T424G21D31AC21F31AW31AF23D3104315Z2T52PL214315V319026X311E316631AT2S5318R2QG318T261311F2DF22P2M5314V24I2YR316C2Z131BI2E5315J31BF2TD26H24P311F2NP24V31B12QG31B3319B2ME2MG24G24P31AX31C8311V2EH311X27526F314H2LI21J2YH2UC2NQ31A831BE31BP2T5318V2T5318X31B431B8315W315S319Q2LF31BT31CO2LM2PH2PU2YW2PU2YY2LR315W2R731032QG310626X314G2LI1H2RE2NS2NP24R31DA310527524T26X318Z23C2ZV2UL1C315S27522S319R26X22S31A62NP22S2NU2YT22S315L2MG22S2MG24I317A22S317A24I2M722S2M724I318722S31872S931DI2UN31CD2UP313L2DA2K9312W312F2Y22VI2VK313O313Q2AK313T31272W02ES313W2KY313Y26Z314031DN2RU2L5314431F83146314128A3143314B2D0314D2AQ31FB26X2YE1623E31A626X2PB315S2PE315S31CQ31BC2NP24J25T2M531EE315T316024R25D2M5318731BN2PS315Y31G831G42QG317A2S9318Z2S524V319F31A6319C2MF2UN2MK26X21A31CG161D31FU31FW31BS318S2P331BO2YT24M318U316024V31GH21F317A24Z2M42QG2M725326X31DF2MB25T2IC12317A31H631CV2M22QF2QH27524Y26X31FY31HU24X319231DC253319I2QG310V3108318031HB2AW319Z2QG31A125B31IA21F31A123N31IE31A12IK2LO23H2MG24Y24H2M011310H31I2319J310725T31I7317A25731C121F31B325B2Z52QG311N23N22X2M5318Z310I2612PB31IN23L2PJ31AO2UI31GQ2YP2OY31H831BK1621L314V31HV31HX2HQ24X316O316H2FR31I321F31I531IW2LP31IY31II2F231K426X31IH31A0310731JC319D2HQ31IP2LP31IS31I31Q31K0318021N31IY31C121131J231J421F31J631J82QG31JA31IK31KC24Y31JF2LP31JH2MC31C52LY2V731BR31DD318F2QG318H26X24Z2NH1H316S2IC1B2MG24N21T2M5318D2YU23D311F2R721D2M521D27524L31AR2LX2ZR317W315B1D315E27123D2R4314J2YU2LO2102YL317Y1622Q31802UI2ZJ2YT24Q27922W27924V1X2YF1X27524Z31LK2QG31LM24Y310O311F2MG2571H2M531DG2HQ31H431HU261315F31GR2HQ2YN31MX31HU31632PO31CQ31C72M52M023D23M318426Z210318723V26P315D22Q26P27823M31MG27523L314P314R31LY314U31712YN311S2LO23D23N26H315D1Q311E26X23M25525L26Z21N2BA23Q2NP21R2NP23U25D2A321N318731NV2NS2YT2PO311M2Z322X311R22P31OZ23Q24U26P2ZB2EH25325T315D21L25T27825631HW31602J331I02F231JY310V25A25D31I7318731K831IB27523R31K623V31K625A31KB31N825624H315W310H25B31KH31PL31PN26X1W31PP31J031B323R31KQ311N23V31KT21F31JA31PX31JD311823L315W31JH24U31JJ2UD31P52PM25325L315D2M631PD31PF316631PH26X21Q31DC31Q42LI22Y31Q631PO27531PQ31IF31PS31PU31PW31PY2MG31Q031Q231PJ31IU2WK31Q721F31QA2M531QC31J422Q31QF31KT21931QJ31RH31QM31QO2UD31QR2PN317A31I8310Z31P526Z2MK23N316L2QG316O26X23Q2MG31N823V24X31QX316I26X23Z24P31QX31BX26X24324H31NR24H27824724931NR24927831SG31L32OD2EH1E2EH23X2LS26X23C2ZQ31BN2751C31E731TF31EA317A1C317A31102IC23B31142M7311G25A31S82MK23R24131QX24127823U316323Y2QO2412QC23C2IC31512M71C2M725A311D26X31TP2DW318731RP27523M31TU2EH23V31TX2QG31TZ27A31632422QO2452692IC23C2PT315131871C31OS31UE31UG31OD2BA31HT31SF31UM27523Z31UP21F31UR24231632462QO249319C23C31O624I2BA1C31OJ31V52M723Q31DC31JW31T523T31S92EH24331VE31UR246316324A2QO24D31HL31TB310D315131DC1C31DC23U31VT27523U2M02LP31WL31U331VZ2MK24731W327824A316324E2QO26931UE23C2LT315131WL1C31WN31UE122M731WO2PM24723T31QX23T31WT31R027924A310331S931DC24F31PK27524E23L31I731JH26B31K626F31K626J31K624E31KB31IM27524A2ZX26X31IR27531XM31RM31XP31XR27526B31QB31CE31QE27526J31QH31JA31XZ31QL26X24A31AL31L027523Y31S331U331BX31WQ23D31NR31LO315T25D315Z23C3184315131TK31EE2MG1C31EA31UA31EI31V231GC31VQ319A31WE31DC24I31X331WL31TE26X31TG31YR319C1X2MG31YU26W31M927524723531NR23527824B31DA1H31DC31YS2NS31JK2751631DY31CD');local n=bit and bit.bxor or function(l,o)local e,n=1,0 while l>0 and o>0 do local a,c=l%2,o%2 if a~=c then n=n+e end l,o,e=(l-a)/2,(o-c)/2,e*2 end if l<o then l=o end while l>0 do local o=l%2 if o>0 then n=n+e end l,e=(l-o)/2,e*2 end return n end local function o(o,l,e)if e then local l=(o/2^(l-1))%2^((e-1)-(l-1)+1);return l-l%1;else local l=2^(l-1);return(o%(l+l)>=l)and 1 or 0;end;end;local l=1;local function e()local e,a,c,o=r(a,l,l+3);e=n(e,249)a=n(a,249)c=n(c,249)o=n(o,249)l=l+4;return(o*16777216)+(c*65536)+(a*256)+e;end;local function d()local o=n(r(a,l,l),249);l=l+1;return o;end;local function i()local l=e();local e=e();local c=1;local n=(o(e,1,20)*(2^32))+l;local l=o(e,21,31);local o=((-1)^o(e,32));if(l==0)then if(n==0)then return o*0;else l=1;c=0;end;elseif(l==2047)then return(n==0)and(o*(1/0))or(o*(0/0));end;return Q(o,l-1023)*(c+(n/(2^52)));end;local X=e;local function Q(o)local e;if(not o)then o=X();if(o==0)then return'';end;end;e=c(a,l,l+o-1);l=l+o;local o={}for l=1,#e do o[l]=t(n(r(c(e,l,l)),249))end return L(o);end;local l=e;local function X(...)return{...},P('#',...)end local function h()local f={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};local t={0,0,0,0,0,0,0,0,0,0};local l={};local a={f,nil,t,nil,l};local l=e()local c={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};for e=1,l do local o=d();local l;if(o==1)then l=(d()~=0);elseif(o==0)then l=i();elseif(o==2)then l=Q();end;c[e]=l;end;a[2]=c for l=1,e()do t[l-1]=h();end;a[4]=d();for a=1,e()do local c=n(e(),91);local e=n(e(),202);local n=o(c,1,2);local l=o(e,1,11);local l={l,o(c,3,11),nil,nil,e};if(n==0)then l[3]=o(c,12,20);l[5]=o(c,21,29);elseif(n==1)then l[3]=o(e,12,33);elseif(n==2)then l[3]=o(e,12,32)-1048575;elseif(n==3)then l[3]=o(e,12,32)-1048575;l[5]=o(c,21,29);end;f[a]=l;end;return a;end;local function L(l,r,t)local e=l[1];local c=l[2];local o=l[3];local l=l[4];return function(...)local n=e;local c=c;local C=o;local a=l;local D=X local o=1;local d=-1;local X={};local i={...};local P=P('#',...)-1;local Q={};local e={};for l=0,P do if(l>=a)then X[l-a]=i[l+1];else e[l]=i[l+1];end;end;local l=P-a+1 local l;local a;while true do l=n[o];a=l[1];if a<=45 then if a<=22 then if a<=10 then if a<=4 then if a<=1 then if a==0 then local o=l[2];local n=e[o];local l=l[3];for l=1,l do n[l]=e[o+l]end;else if(c[l[2]]>=e[l[5]])then o=o+1;else o=o+l[3];end;end;elseif a<=2 then local X;local Q;local i;local r;local P;local a;e[l[2]][c[l[3]]]=e[l[5]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];a=l[2];P={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;P[r]=e[l];end;Q={e[a](f(P,1,i-a))};i=a+l[5]-2;r=0;for l=a,i do r=r+1;e[l]=Q[r];end;d=i;o=o+1;l=n[o];e[l[2]][c[l[3]]]=e[l[5]];o=o+1;l=n[o];a=l[2];P={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;P[r]=e[l];end;e[a](f(P,1,i-a));d=a;o=o+1;l=n[o];a=l[2];X=e[l[3]];e[a+1]=X;e[a]=X[c[l[5]]];elseif a>3 then local P;local r;local i;local a;e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];a=l[2];i={};r=0;P=a+l[3]-1;for l=a+1,P do r=r+1;i[r]=e[l];end;e[a](f(i,1,P-a));d=a;o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];else local n=l[2];local c={};local o=0;local a=d;for l=n+1,a do o=o+1;c[o]=e[l];end;local c={e[n](f(c,1,a-n))};local l=n+l[5]-2;o=0;for l=n,l do o=o+1;e[l]=c[o];end;d=l;end;elseif a<=7 then if a<=5 then if not e[l[2]]then o=o+1;else o=o+l[3];end;elseif a>6 then r[l[3]]=e[l[2]];else e[l[2]][c[l[3]]]=e[l[5]];end;elseif a<=8 then e[l[2]]=e[l[3]][c[l[5]]];elseif a>9 then local X;local i;local a;local P;local r;e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]={};o=o+1;l=n[o];e[l[2]][c[l[3]]]=c[l[5]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];r=l[2];P={};a=0;i=r+l[3]-1;for l=r+1,i do a=a+1;P[a]=e[l];end;X={e[r](f(P,1,i-r))};i=r+l[5]-2;a=0;for l=r,i do a=a+1;e[l]=X[a];end;d=i;o=o+1;l=n[o];e[l[2]][c[l[3]]]=e[l[5]];else local a=l[2];local c={};for l=1,#Q do local l=Q[l];for o=0,#l do local l=l[o];local n=l[1];local o=l[2];if n==e and o>=a then c[o]=n[o];l[1]=c;end;end;end;end;elseif a<=16 then if a<=13 then if a<=11 then e[l[2]]={};elseif a>12 then e[l[2]][c[l[3]]]=c[l[5]];else e[l[2]]=e[l[3]];end;elseif a<=14 then do return end;elseif a==15 then local P;local r;local i;local X;local a;e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];a=l[2];X=e[l[3]];e[a+1]=X;e[a]=X[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]];o=o+1;l=n[o];a=l[2];i={};r=0;P=a+l[3]-1;for l=a+1,P do r=r+1;i[r]=e[l];end;e[a](f(i,1,P-a));d=a;o=o+1;l=n[o];do return end;else local n=l[3];local o=e[n]for l=n+1,l[5]do o=o..e[l];end;e[l[2]]=o;end;elseif a<=19 then if a<=17 then local X;local P;local Q;local a;local i;local L;e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]];o=o+1;l=n[o];L=l[3];i=e[L]for l=L+1,l[5]do i=i..e[l];end;e[l[2]]=i;o=o+1;l=n[o];a=l[2];Q={};P=0;X=a+l[3]-1;for l=a+1,X do P=P+1;Q[P]=e[l];end;e[a](f(Q,1,X-a));d=a;o=o+1;l=n[o];r[l[3]]=e[l[2]];o=o+1;l=n[o];do return end;elseif a==18 then local o=l[2];local c={};local n=0;local l=o+l[3]-1;for l=o+1,l do n=n+1;c[n]=e[l];end;e[o](f(c,1,l-o));d=o;else local P;local X;local r;local t;local i;local a;e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];a=l[2];i={};t=0;r=a+l[3]-1;for l=a+1,r do t=t+1;i[t]=e[l];end;X={e[a](f(i,1,r-a))};r=a+l[5]-2;t=0;for l=a,r do t=t+1;e[l]=X[t];end;d=r;o=o+1;l=n[o];e[l[2]][c[l[3]]]=e[l[5]];o=o+1;l=n[o];a=l[2];i={};t=0;r=a+l[3]-1;for l=a+1,r do t=t+1;i[t]=e[l];end;e[a](f(i,1,r-a));d=a;o=o+1;l=n[o];a=l[2];P=e[l[3]];e[a+1]=P;e[a]=P[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]={};end;elseif a<=20 then if(e[l[2]]==e[l[5]])then o=o+1;else o=o+l[3];end;elseif a>21 then local P;local X;local r;local t;local i;local a;e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];a=l[2];i={};t=0;r=a+l[3]-1;for l=a+1,r do t=t+1;i[t]=e[l];end;X={e[a](f(i,1,r-a))};r=a+l[5]-2;t=0;for l=a,r do t=t+1;e[l]=X[t];end;d=r;o=o+1;l=n[o];e[l[2]][c[l[3]]]=e[l[5]];o=o+1;l=n[o];a=l[2];i={};t=0;r=a+l[3]-1;for l=a+1,r do t=t+1;i[t]=e[l];end;e[a](f(i,1,r-a));d=a;o=o+1;l=n[o];a=l[2];P=e[l[3]];e[a+1]=P;e[a]=P[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];else e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];r[l[3]]=e[l[2]];o=o+1;l=n[o];e[l[2]]=r[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];r[l[3]]=e[l[2]];o=o+1;l=n[o];e[l[2]]=r[l[3]];o=o+1;l=n[o];e[l[2]]=r[l[3]];o=o+1;l=n[o];if(e[l[2]]~=e[l[5]])then o=o+1;else o=o+l[3];end;end;elseif a<=33 then if a<=27 then if a<=24 then if a==23 then local o=l[2];local n=e[l[3]];e[o+1]=n;e[o]=n[c[l[5]]];else e[l[2]]={unpack({},1,l[3])};end;elseif a<=25 then local n=l[2];local o=e[l[3]];e[n+1]=o;e[n]=o[c[l[5]]];elseif a>26 then local Q;local i;local r;local P;local X;local a;e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];a=l[2];X=e[l[3]];e[a+1]=X;e[a]=X[c[l[5]]];o=o+1;l=n[o];a=l[2];P={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;P[r]=e[l];end;e[a](f(P,1,i-a));d=a;o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];a=l[2];X=e[l[3]];e[a+1]=X;e[a]=X[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];a=l[2];P={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;P[r]=e[l];end;Q={e[a](f(P,1,i-a))};i=a+l[5]-2;r=0;for l=a,i do r=r+1;e[l]=Q[r];end;d=i;o=o+1;l=n[o];a=l[2];X=e[l[3]];e[a+1]=X;e[a]=X[c[l[5]]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];a=l[2];P={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;P[r]=e[l];end;e[a](f(P,1,i-a));d=a;o=o+1;l=n[o];o=o+l[3];else local d=C[l[3]];local a;local c={};a=M({},{__index=function(o,l)local l=c[l];return l[1][l[2]];end,__newindex=function(e,l,o)local l=c[l]l[1][l[2]]=o;end;});for a=1,l[5]do o=o+1;local l=n[o];if l[1]==63 then c[a-1]={e,l[3]};else c[a-1]={r,l[3]};end;Q[#Q+1]=c;end;e[l[2]]=L(d,a,t);end;elseif a<=30 then if a<=28 then local n=l[2];local a={};local o=0;local c=d;for l=n+1,c do o=o+1;a[o]=e[l];end;local c={e[n](f(a,1,c-n))};local l=n+l[5]-2;o=0;for l=n,l do o=o+1;e[l]=c[o];end;d=l;elseif a>29 then local P;local X;local r;local t;local i;local a;e[l[2]]=c[l[3]];o=o+1;l=n[o];a=l[2];i={};t=0;r=a+l[3]-1;for l=a+1,r do t=t+1;i[t]=e[l];end;X={e[a](f(i,1,r-a))};r=a+l[5]-2;t=0;for l=a,r do t=t+1;e[l]=X[t];end;d=r;o=o+1;l=n[o];e[l[2]][c[l[3]]]=e[l[5]];o=o+1;l=n[o];a=l[2];i={};t=0;r=a+l[3]-1;for l=a+1,r do t=t+1;i[t]=e[l];end;e[a](f(i,1,r-a));d=a;o=o+1;l=n[o];for l=l[2],l[3]do e[l]=nil;end;o=o+1;l=n[o];a=l[2];P=e[l[3]];e[a+1]=P;e[a]=P[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]={unpack({},1,l[3])};o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];else if(e[l[2]]==e[l[5]])then o=o+1;else o=o+l[3];end;end;elseif a<=31 then e[l[2]][c[l[3]]]=e[l[5]];elseif a>32 then local n=l[2];local c=l[5];local l=n+2;local a={e[n](e[n+1],e[l])};for o=1,c do e[l+o]=a[o];end;local n=e[n+3];if n then e[l]=n else o=o+1;end;else local o=l[2];local c,n={e[o]()};local n=o+l[5]-2;local l=0;for o=o,n do l=l+1;e[o]=c[l];end;d=n;end;elseif a<=39 then if a<=36 then if a<=34 then e[l[2]]=L(C[l[3]],nil,t);elseif a>35 then local r;local i;local t;local P;local a;a=l[2];P={};t=0;i=a+l[3]-1;for l=a+1,i do t=t+1;P[t]=e[l];end;e[a](f(P,1,i-a));d=a;o=o+1;l=n[o];for l=l[2],l[3]do e[l]=nil;end;o=o+1;l=n[o];a=l[2];r=e[l[3]];e[a+1]=r;e[a]=r[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]];o=o+1;l=n[o];e[l[2]]=(l[3]~=0);else local Q;local i;local X;local a;local t;local P;e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=r[l[3]];o=o+1;l=n[o];P=l[3];t=e[P]for l=P+1,l[5]do t=t..e[l];end;e[l[2]]=t;o=o+1;l=n[o];a=l[2];X={};i=0;Q=a+l[3]-1;for l=a+1,Q do i=i+1;X[i]=e[l];end;e[a](f(X,1,Q-a));d=a;o=o+1;l=n[o];o=o+l[3];end;elseif a<=37 then local o=l[2];local n=e[o];local l=l[3];for l=1,l do n[l]=e[o+l]end;elseif a>38 then e[l[2]]=c[l[3]];else e[l[2]]=r[l[3]];end;elseif a<=42 then if a<=40 then e[l[2]]=e[l[3]][c[l[5]]];elseif a>41 then local n=l[3];local o=e[n]for l=n+1,l[5]do o=o..e[l];end;e[l[2]]=o;else e[l[2]]=t[c[l[3]]];end;elseif a<=43 then if not e[l[2]]then o=o+1;else o=o+l[3];end;elseif a==44 then for l=l[2],l[3]do e[l]=nil;end;else o=o+l[3];end;elseif a<=68 then if a<=56 then if a<=50 then if a<=47 then if a==46 then local n=l[2];local c={};local o=0;local l=n+l[3]-1;for l=n+1,l do o=o+1;c[o]=e[l];end;local c,l=D(e[n](f(c,1,l-n)));l=l+n-1;o=0;for l=n,l do o=o+1;e[l]=c[o];end;d=l;else do return end;end;elseif a<=48 then local r;local P;local t;local i;local a;a=l[2];i={};t=0;P=a+l[3]-1;for l=a+1,P do t=t+1;i[t]=e[l];end;e[a](f(i,1,P-a));d=a;o=o+1;l=n[o];for l=l[2],l[3]do e[l]=nil;end;o=o+1;l=n[o];a=l[2];r=e[l[3]];e[a+1]=r;e[a]=r[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]];o=o+1;l=n[o];e[l[2]]=(l[3]~=0);elseif a==49 then local i;local X;local r;local P;local a;a=l[2];P={};r=0;X=a+l[3]-1;for l=a+1,X do r=r+1;P[r]=e[l];end;e[a](f(P,1,X-a));d=a;o=o+1;l=n[o];a=l[2];i=e[l[3]];e[a+1]=i;e[a]=i[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]={};o=o+1;l=n[o];e[l[2]][c[l[3]]]=c[l[5]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];else local X;local Q;local i;local r;local P;local a;e[l[2]][c[l[3]]]=e[l[5]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];a=l[2];P={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;P[r]=e[l];end;Q={e[a](f(P,1,i-a))};i=a+l[5]-2;r=0;for l=a,i do r=r+1;e[l]=Q[r];end;d=i;o=o+1;l=n[o];e[l[2]][c[l[3]]]=e[l[5]];o=o+1;l=n[o];a=l[2];P={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;P[r]=e[l];end;e[a](f(P,1,i-a));d=a;o=o+1;l=n[o];a=l[2];X=e[l[3]];e[a+1]=X;e[a]=X[c[l[5]]];end;elseif a<=53 then if a<=51 then r[l[3]]=e[l[2]];elseif a>52 then local a=l[2];local c={};for l=1,#Q do local l=Q[l];for o=0,#l do local l=l[o];local n=l[1];local o=l[2];if n==e and o>=a then c[o]=n[o];l[1]=c;end;end;end;else local Q;local P;local X;local a;local i;local L;e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]];o=o+1;l=n[o];L=l[3];i=e[L]for l=L+1,l[5]do i=i..e[l];end;e[l[2]]=i;o=o+1;l=n[o];a=l[2];X={};P=0;Q=a+l[3]-1;for l=a+1,Q do P=P+1;X[P]=e[l];end;e[a](f(X,1,Q-a));d=a;o=o+1;l=n[o];r[l[3]]=e[l[2]];o=o+1;l=n[o];do return end;end;elseif a<=54 then local L;local X;local i;local P;local Q;local a;e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];r[l[3]]=e[l[2]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];a=l[2];Q=e[l[3]];e[a+1]=Q;e[a]=Q[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=r[l[3]];o=o+1;l=n[o];a=l[2];P={};i=0;X=a+l[3]-1;for l=a+1,X do i=i+1;P[i]=e[l];end;e[a](f(P,1,X-a));d=a;o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];a=l[2];P={};i=0;X=a+l[3]-1;for l=a+1,X do i=i+1;P[i]=e[l];end;e[a](f(P,1,X-a));d=a;o=o+1;l=n[o];e[l[2]]=r[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];r[l[3]]=e[l[2]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=r[l[3]];o=o+1;l=n[o];Q=l[3];L=e[Q]for l=Q+1,l[5]do L=L..e[l];end;e[l[2]]=L;o=o+1;l=n[o];a=l[2];P={};i=0;X=a+l[3]-1;for l=a+1,X do i=i+1;P[i]=e[l];end;e[a](f(P,1,X-a));d=a;o=o+1;l=n[o];o=o+l[3];elseif a>55 then local P;local r;local i;local a;a=l[2];i={};r=0;P=a+l[3]-1;for l=a+1,P do r=r+1;i[r]=e[l];end;e[a](f(i,1,P-a));d=a;o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];if(e[l[2]]~=e[l[5]])then o=o+1;else o=o+l[3];end;else local r;local i;local t;local P;local a;a=l[2];P={};t=0;i=a+l[3]-1;for l=a+1,i do t=t+1;P[t]=e[l];end;e[a](f(P,1,i-a));d=a;o=o+1;l=n[o];for l=l[2],l[3]do e[l]=nil;end;o=o+1;l=n[o];a=l[2];r=e[l[3]];e[a+1]=r;e[a]=r[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]];o=o+1;l=n[o];e[l[2]]=(l[3]~=0);end;elseif a<=62 then if a<=59 then if a<=57 then e[l[2]][c[l[3]]]=c[l[5]];elseif a==58 then local L;local i;local Q;local a;local P;local X;e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]];o=o+1;l=n[o];X=l[3];P=e[X]for l=X+1,l[5]do P=P..e[l];end;e[l[2]]=P;o=o+1;l=n[o];a=l[2];Q={};i=0;L=a+l[3]-1;for l=a+1,L do i=i+1;Q[i]=e[l];end;e[a](f(Q,1,L-a));d=a;o=o+1;l=n[o];r[l[3]]=e[l[2]];o=o+1;l=n[o];do return end;else if(c[l[2]]>=e[l[5]])then o=o+1;else o=o+l[3];end;end;elseif a<=60 then if(e[l[2]]~=e[l[5]])then o=o+1;else o=o+l[3];end;elseif a==61 then e[l[2]]=(l[3]~=0);else local Q;local P;local r;local X;local i;local a;e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];a=l[2];i=e[l[3]];e[a+1]=i;e[a]=i[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];a=l[2];X={};r=0;P=a+l[3]-1;for l=a+1,P do r=r+1;X[r]=e[l];end;Q={e[a](f(X,1,P-a))};P=a+l[5]-2;r=0;for l=a,P do r=r+1;e[l]=Q[r];end;d=P;o=o+1;l=n[o];a=l[2];i=e[l[3]];e[a+1]=i;e[a]=i[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];end;elseif a<=65 then if a<=63 then e[l[2]]=e[l[3]];elseif a>64 then local i;local r;local t;local P;local a;a=l[2];P={};t=0;r=a+l[3]-1;for l=a+1,r do t=t+1;P[t]=e[l];end;e[a](f(P,1,r-a));d=a;o=o+1;l=n[o];for l=l[2],l[3]do e[l]=nil;end;o=o+1;l=n[o];a=l[2];i=e[l[3]];e[a+1]=i;e[a]=i[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]];o=o+1;l=n[o];e[l[2]]=(l[3]~=0);else local X;local i;local a;local P;local r;e[l[2]]={};o=o+1;l=n[o];e[l[2]][c[l[3]]]=c[l[5]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];r=l[2];P={};a=0;i=r+l[3]-1;for l=r+1,i do a=a+1;P[a]=e[l];end;X={e[r](f(P,1,i-r))};i=r+l[5]-2;a=0;for l=r,i do a=a+1;e[l]=X[a];end;d=i;o=o+1;l=n[o];e[l[2]][c[l[3]]]=e[l[5]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];end;elseif a<=66 then local n=l[2];local a=l[5];local l=n+2;local c={e[n](e[n+1],e[l])};for o=1,a do e[l+o]=c[o];end;local n=e[n+3];if n then e[l]=n else o=o+1;end;elseif a>67 then local r;local i;local t;local P;local a;a=l[2];P={};t=0;i=a+l[3]-1;for l=a+1,i do t=t+1;P[t]=e[l];end;e[a](f(P,1,i-a));d=a;o=o+1;l=n[o];for l=l[2],l[3]do e[l]=nil;end;o=o+1;l=n[o];a=l[2];r=e[l[3]];e[a+1]=r;e[a]=r[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]];o=o+1;l=n[o];e[l[2]]=(l[3]~=0);else local X;local i;local a;local P;local r;e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];r=l[2];P={};a=0;i=r+l[3]-1;for l=r+1,i do a=a+1;P[a]=e[l];end;X={e[r](f(P,1,i-r))};i=r+l[5]-2;a=0;for l=r,i do a=a+1;e[l]=X[a];end;d=i;o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]][c[l[3]]]=e[l[5]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]][c[l[3]]]=e[l[5]];end;elseif a<=79 then if a<=73 then if a<=70 then if a==69 then local n=l[2];local c={};local o=0;local l=n+l[3]-1;for l=n+1,l do o=o+1;c[o]=e[l];end;local c,l=D(e[n](f(c,1,l-n)));l=l+n-1;o=0;for l=n,l do o=o+1;e[l]=c[o];end;d=l;else e[l[2]]={unpack({},1,l[3])};end;elseif a<=71 then local Q;local i;local L;local a;local P;local X;e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]];o=o+1;l=n[o];X=l[3];P=e[X]for l=X+1,l[5]do P=P..e[l];end;e[l[2]]=P;o=o+1;l=n[o];a=l[2];L={};i=0;Q=a+l[3]-1;for l=a+1,Q do i=i+1;L[i]=e[l];end;e[a](f(L,1,Q-a));d=a;o=o+1;l=n[o];r[l[3]]=e[l[2]];o=o+1;l=n[o];do return end;elseif a==72 then local n=l[2];local c={};local o=0;local a=n+l[3]-1;for l=n+1,a do o=o+1;c[o]=e[l];end;local c={e[n](f(c,1,a-n))};local l=n+l[5]-2;o=0;for l=n,l do o=o+1;e[l]=c[o];end;d=l;else local Q;local i;local r;local X;local P;local a;e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];a=l[2];P=e[l[3]];e[a+1]=P;e[a]=P[c[l[5]]];o=o+1;l=n[o];a=l[2];X={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;X[r]=e[l];end;e[a](f(X,1,i-a));d=a;o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];a=l[2];P=e[l[3]];e[a+1]=P;e[a]=P[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];a=l[2];X={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;X[r]=e[l];end;Q={e[a](f(X,1,i-a))};i=a+l[5]-2;r=0;for l=a,i do r=r+1;e[l]=Q[r];end;d=i;o=o+1;l=n[o];a=l[2];P=e[l[3]];e[a+1]=P;e[a]=P[c[l[5]]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];a=l[2];X={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;X[r]=e[l];end;e[a](f(X,1,i-a));d=a;o=o+1;l=n[o];do return end;end;elseif a<=76 then if a<=74 then if(e[l[2]]~=e[l[5]])then o=o+1;else o=o+l[3];end;elseif a>75 then for l=l[2],l[3]do e[l]=nil;end;else local d=C[l[3]];local a;local c={};a=M({},{__index=function(o,l)local l=c[l];return l[1][l[2]];end,__newindex=function(e,l,o)local l=c[l]l[1][l[2]]=o;end;});for a=1,l[5]do o=o+1;local l=n[o];if l[1]==63 then c[a-1]={e,l[3]};else c[a-1]={r,l[3]};end;Q[#Q+1]=c;end;e[l[2]]=L(d,a,t);end;elseif a<=77 then e[l[2]]=(l[3]~=0);elseif a>78 then local o=l[2];local c={};local n=0;local l=o+l[3]-1;for l=o+1,l do n=n+1;c[n]=e[l];end;e[o](f(c,1,l-o));d=o;else local n=l[2];local a={};local o=0;local c=n+l[3]-1;for l=n+1,c do o=o+1;a[o]=e[l];end;local c={e[n](f(a,1,c-n))};local l=n+l[5]-2;o=0;for l=n,l do o=o+1;e[l]=c[o];end;d=l;end;elseif a<=85 then if a<=82 then if a<=80 then e[l[2]]=L(C[l[3]],nil,t);elseif a==81 then e[l[2]]=c[l[3]];else o=o+l[3];end;elseif a<=83 then local P;local i;local r;local X;local a;a=l[2];X={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;X[r]=e[l];end;e[a](f(X,1,i-a));d=a;o=o+1;l=n[o];a=l[2];P=e[l[3]];e[a+1]=P;e[a]=P[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]={};o=o+1;l=n[o];e[l[2]][c[l[3]]]=c[l[5]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];elseif a>84 then local o=l[2];local c,n={e[o]()};local n=o+l[5]-2;local l=0;for o=o,n do l=l+1;e[o]=c[l];end;d=n;else local L;local P;local i;local X;local Q;local a;r[l[3]]=e[l[2]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];a=l[2];Q=e[l[3]];e[a+1]=Q;e[a]=Q[c[l[5]]];o=o+1;l=n[o];e[l[2]]=r[l[3]];o=o+1;l=n[o];a=l[2];X={};i=0;P=a+l[3]-1;for l=a+1,P do i=i+1;X[i]=e[l];end;L={e[a](f(X,1,P-a))};P=a+l[5]-2;i=0;for l=a,P do i=i+1;e[l]=L[i];end;d=P;o=o+1;l=n[o];r[l[3]]=e[l[2]];o=o+1;l=n[o];e[l[2]]=r[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];r[l[3]]=e[l[2]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=r[l[3]];o=o+1;l=n[o];a=l[2];X={};i=0;P=a+l[3]-1;for l=a+1,P do i=i+1;X[i]=e[l];end;e[a](f(X,1,P-a));d=a;o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=r[l[3]];o=o+1;l=n[o];a=l[2];X={};i=0;P=a+l[3]-1;for l=a+1,P do i=i+1;X[i]=e[l];end;e[a](f(X,1,P-a));d=a;o=o+1;l=n[o];do return end;end;elseif a<=88 then if a<=86 then local a,a;local X;local i;local r;local P;local Q;local a;e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];a=l[2];Q=e[l[3]];e[a+1]=Q;e[a]=Q[c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];a=l[2];P={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;P[r]=e[l];end;X={e[a](f(P,1,i-a))};i=a+l[5]-2;r=0;for l=a,i do r=r+1;e[l]=X[r];end;d=i;o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];a=l[2];Q=e[l[3]];e[a+1]=Q;e[a]=Q[c[l[5]]];o=o+1;l=n[o];a=l[2];P={};r=0;i=a+l[3]-1;for l=a+1,i do r=r+1;P[r]=e[l];end;X,i=D(e[a](f(P,1,i-a)));i=i+a-1;r=0;for l=a,i do r=r+1;e[l]=X[r];end;d=i;o=o+1;l=n[o];a=l[2];P={};r=0;i=d;for l=a+1,i do r=r+1;P[r]=e[l];end;X={e[a](f(P,1,i-a))};i=a+l[5]-2;r=0;for l=a,i do r=r+1;e[l]=X[r];end;d=i;o=o+1;l=n[o];o=o+l[3];elseif a==87 then e[l[2]]=r[l[3]];else e[l[2]]=t[c[l[3]]];end;elseif a<=89 then local X;local i;local a;local P;local r;e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];r=l[2];P={};a=0;i=r+l[3]-1;for l=r+1,i do a=a+1;P[a]=e[l];end;X={e[r](f(P,1,i-r))};i=r+l[5]-2;a=0;for l=r,i do a=a+1;e[l]=X[a];end;d=i;o=o+1;l=n[o];e[l[2]][c[l[3]]]=e[l[5]];o=o+1;l=n[o];e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];elseif a==90 then local L;local i;local Q;local a;local P;local X;e[l[2]]=t[c[l[3]]];o=o+1;l=n[o];e[l[2]]=c[l[3]];o=o+1;l=n[o];e[l[2]]=e[l[3]];o=o+1;l=n[o];X=l[3];P=e[X]for l=X+1,l[5]do P=P..e[l];end;e[l[2]]=P;o=o+1;l=n[o];a=l[2];Q={};i=0;L=a+l[3]-1;for l=a+1,L do i=i+1;Q[i]=e[l];end;e[a](f(Q,1,L-a));d=a;o=o+1;l=n[o];r[l[3]]=e[l[2]];o=o+1;l=n[o];do return end;else e[l[2]]={};end;o=o+1;end;end;end;return L(h(),{},s())();
