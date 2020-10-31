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
--MainMenu
local t=string.byte;local i=string.char;local c=string.sub;local J=table.concat;local I=math.ldexp;local L=getfenv or function()return _ENV end;local G=setmetatable;local r=select;local f=unpack;local M=tonumber;local function A(f)local e,o,n="","",{}local d=256;local a={}for l=0,d-1 do a[l]=i(l)end;local l=1;local function t()local e=M(c(f,l,l),36)l=l+1;local o=M(c(f,l,l+e-1),36)l=l+e;return o end;e=i(t())n[1]=e;while l<#f do local l=t()if a[l]then o=a[l]else o=e..c(e,1,1)end;a[d]=e..c(o,1,1)n[#n+1],e,d=o,o,d+1 end;return table.concat(n)end;local d=A('26I25F26I27626G26M27626I23X23V23R23Z26G26L27A25623Q23V23T23Z24J23Y26G26B27A27E23O24F24A27K27M26G26J27A24D26G26E27A24P24823Z23V24E23Z24S23P23Q23Y23Z24826G26827A25423Z24923Z24E25524A23N23O24926G26N27A24A23V23N24828U28J27624T28O25528G24C23N27Y26Z28K23Z27W29A28923Z23Y25524E23P24823V23X27F26A27A23V23Q23Q23K24F24E24924F26G26927A29524E24P23M23N28E28723O26G26C27A24S28S23Y2AF2912A52A728E26G26G27A24H24T28V27A24E23V23S23Q27F26K27A28S28N24824E27827A24K27D27F28W27624M2AV23Z23Q26G25R27A2972AX23T24E25M24E23M23Z25M2AQ25M24923Q23P2BM24323P24F25M24D23V23O2BM29L25M23T23M2C329P26G29R27625A23Z24228P23N24023Z26H27A27A25G24Q27Q27A2CF2CH24P28D29M26G2AZ2762CV2BV24826127G27A23W24823P23R25424T24O2CM2CN1A23P2CQ27H27624O23X2D129M2DE27A1A23O24Q2DP2762162592DT2CN27625Y2CQ25N28523M23P23P28N25M2BY24F24825M23L23X24925M2C323Y25M24A2872492EG25525624J24K2BR2AR2CD26I24U2D824A23Y23P24D2AB2DJ26I2BS25524M24L25A26G2DP2EE2632FB27A2EE2602FF2762EE2D42FC23X26626G26Y27A25924I24R25A25M24U24L25M24Z24L25B25M25924R24K2FA27227A26325M2EP2ER25M24V24R24P24I25M2632622GC24V24P25G25G2DU2762662CQ2CZ26I24O29X29L2AB26F2BI2AU2B32GC28R23O2ET2AC29D28N2BM28Q28S25M24K24L2592EV26J2EV2B527627C27E2D527627J23V24328G28U2A22BB23P23T29T2HT2HV28H2BA26I2492AU24E2402HN26I23R28Z2AB2AD2762AF23O2AH2902I82A62A827P2I625829T24F2B928X24828S24E2CN2G927623227A22U27A22Z26A1Q1L1X2CD22Y26A25M26I2JB2762JD2622JG2JC26A24Q2JL2JI26A2562JP26I2JD23U2JT22Q27A1X27A22Y26Q2JF1X26Q2JQ2762JH2JU2CD2K92JD24A2JT22Y2FR2JG2KH22Z24Q2J91X2JO26I22U2KB2JC26Y2FR1X2KJ2KL2JA2KO22U2KH2KV2JI2KT2KI2J22KR27626J2AO2772I62EL2IY28I2BI2BE23Z2BL29I25S2JF27A2F42J72J91Z2CD22V26Y2KM2KH2JY2K82J426Y2JK2L22JU2L42M22J32LY2L62K82CD2L927A2AS2762LD2C42LF2762BJ2LI28A23Y2LL2CN2LO2J81L2LR2762LT2LV2762LX2JG2LZ2M12KH2KG2KU2KH2M62MY2M82JT2MB2LB2IW2LE29326I2MJ2LJ2MM2LM2762MP2LQ2LS2LU2JA2LW2JZ2MZ2L52M32N32J22NQ2N72K92N926I2MD26I2MF2B42ND2NF2ML2MN2LN2J62MQ2MS26I2MU2NO2MW2NW2KP2M02NS2N22NS2N52K02NX2MA2LA2O02LC2IX2MG2O52LH2NG2O82NJ2OA2NL2MT2NN2M22MX2OO2OI2N02L32NU26I2ON27A2322L727627R2NA2ME2OU2B429C2762GB2GD2ES2GG2GI2GK2622552GO2IC2HP27F2F42I32HW2A127A24M2I02I227K2I42O12I82892IB2I62492H728U2IR2IT2IV2762QG23V2F22OR26I2PN2OS28X28Z2912PY2B82MH26I2A429724829929B29D29F2I12ML29K29M29O29Q29S29U29W29Y2A02HY2R028O2IO2A923Z2IG2AE2AG2AI2IN2AL27P2OR2AQ2CC27A24J28T2AU23O27Y2DP23O23Z2822RJ29K2OU23X2IS23Q2IU2IC2B72HQ2GW25623V2AA2B42Q12Q92Q32RJ2Q62I123Q2Q22I527A2QC2IA2Q42HO2RO23L28Z2AX24C2BE2CN26S27A2332MQ1H2CD22Z2P42N126A2M12CD22R25M2KM2LM2K22K42K62KA2JS2KC26A2JW2KC2L12N426I2JO2P723022Y2KM22Y2JU23E2EK26I1K2LM2372KX2162KO23E2K32PC2TR23D2JW26I2362JW22Y23024Y2J921M24Y2JU23F24I2J921224I27623E25E22226I22Z25E27623B2US2JA2UV26I23E26Y2K42KH23A25M2162JG2LM23E23U2TW2UM23B2TG27623A2621A2JG2JK26I2VV1Q2VY2VU2JK26J1X2VZ2VV26Y2W62VZ23E23M2TW23M2NV2JF1F27A23023U1L1L21M2WM2452PF27621R2EV2732MC2792762C223N24E2GS2WX27A2PZ2HR26I2SV2HX2Q52Q72SU2SP2SW2QM2I92QE2SX2QH2O12SD2SF2ND2QC2B323Z2T62OV2RQ2872R22T628H2WY2I72H72X325Q2CQ2OT2LE2EV25428D2AX2NH2HA27624Z2BZ25M2C92T625M23X2BW2LL2CY28X2XE2X724U28M24E2D82432QZ2R129829A27F26D2CS2LH24A29M28P2YY27Y2EV2CF2AX2Z42B32X72HT27M27O2CN25A2TA2MQ2122CD2PF2JF182CD2312422AO2362ZT2UQ24A1O2WO24A26G22Y2N51527A22T2CD21P29R2UQ27A21M2JI23021E1R2WO21E26J22Y23326Q2UZ2TR2J32JO2172PE2X82N62PC26I2TW310T2KE2P72J32U631112OH2322TY2NV31132PE2PG2WS2KF2TR2K527623124Q29C2KN310K23025U310H21M25U310K311C152JC2LM152LM23125M29C1V25M311L26Q311O26Q311R2CD311T2JI2V826I15312B2312QR26I1V26I311L1I2UT1I2JU311S2JC2VZ152VZ2311A2FR1V2VX2UQ21E2UT21E312O31282JC25U27615313626I23126A2FR14310A230310C310E22I2UT22I312O2KH152TZ2U61T311A2M9276310M2KM310P2U0310V2J32TT310T23E313Z26I2V52P722V2VB1X2VD22Q2KO2KN2J225M2KU2LM2TB2KM2TE23U2KM2UM31162PB31162K8313P313Z2PG23323M2KM2WG2V624A2KM2KE2KP2PG2JD2K42ZN2M42KH23026A1K2JA315C245314W2UZ314Z22Z2422J921O2422762KQ313T2KA31572J23159276310F1N2JA21E1N315G2U41L2122U6310W2JW17310Z31442WA3111315V26I313V2JA313X312231472362KM2362J22UI311F310W24Q2W627A22V310N316H315P26Y2562W62KH22R31631X3166232314G2VM315W23U315Y1X317B2WR2CD2WU2762T9313U2MQ21A2TE2VT2PC316E316G316Q310Q314431412NV310Y2NV3110310T311927622Z316W316Q2JD2U12JM2TT2JM2TW2JM31102LS2UY2JA2V126I22R26I2J9318J316Y2FR21K2KH22V318F2V027622P2VE26I22X2JI2N51M310T2761G313S26I1G315831932N42TR1G310P2LM1G2LM232312B1G312B2322VZ1G2VZ23231391G31392L0318O2N4317G2EV2PI2O02GW27W2HU28G2QB2XH2QB2XK2F42YR2I82YU2QX2HQ2ND2YX2R32YZ26G2Z12CE2Z32Z52XW31AH2Z931AL2ZD2SO27L27N23Y2CN31AJ316F2MQ2102ZN26I2K4310T2M1310T2U12PE317Q25E2KM319K310X310V22V25U2KM3139232316P313X31812OD31BA2JA312B2L031432M222R2MQ2K93177314H2OP2762212ZK2UZ31B12JF2W23182316W2122TR231122G9141226M2UQ1A1U2WO1A31CG2332TM3164319G310U1K316U2622J9216319O2UI31BJ2JI3106316U31BG1L1H313931BU314K2MW26Q31132TR2UX2KM318H22Q31BK31D931462TR31DG313L316Q22Q31172KP313Y2U22562KM2JS22Y2362622VL1K2VZ223314X1L216314Z23631CY2TR235313C26I214313F313H2JU23031CO21M2JF22Y23731513164315323631BG318K31392262CD22P2CD2222W51Q2VZ31E7318O2TR2J52WI2WK23E2WN21M31F82452J52WA31CS27623J23E2J921G3143318W31B52V2236316S1X316N26I23B313J2JA313L2W026224A2WB2762372162KM2VL26I22731G42JA31G622331G91X31G62VJ2K42VN21U2TW21U2V931FV21231FX2VV31G02372VZ23721M2KM310D31G73130315Z2762231A2KM2VX2W025M31GH2V21Y2TW1Y315P31781X2LM31FD316T31FG122KM122V226I31FN2VE31FP2W631FS31FU2J922V31GP31FZ31G126I31G331G527631G831I226I31GC31I531GG31792VE31GJ2JG31GL31FT31FV1X31HX31G02W731G231GV2JA31GX22731GZ216313231I631H31L1Y31H531I931HF31H931HB31HD31BY2KP2LM31IZ318W1A31HI31I0312L2JA312N26I22631J52LM22326I310H2K028021Z26A31JK26A28021V26Y310H2162WA26I22N312431E4312631JE317821H2LM2222CD1S2CD21X1I25X318X1I1L2WR2KH1M319A2761M319D31KK2VN2622FR1E2WC312B1X312B23A26I31J82P722725M31JK312231452PG21Y2PG21T26I2FR318Y312O312B1M31KV31KP26I31KR2W42K831F131KX31J922331L12JA31L331L6315R21U2PG22L31EB22X310A319L31KK31F131LG31LI2UN31391X31ET31LM2P721Z31LP31HF28031LU315R22M2PG22H2L422X2FR310331391M31ET31M32VZ226314D2KO2V531KY27A21V31MC31L331MH315R22I2PG22D26Q31LA2K631032KO1M31MV31MR276222318H1X318H21Y31M927A22N31N028031N4315R22E2PG229317822X31EK232318H1M31NJ31LG122VZ31NK316C31NM25E31JK25E31NP31HO310V22I2UO26G31FR27622F31IG31FX22E24A31IJ315322B31GD31G621B31OR27621731OU26I22E31H72PC2LM22I21U2VX23931IE31OJ2KM31OL31ON2W631OP31IM1X31GX21B31GZ1X31IS21731IU1X31H531OZ31H826I22I31IW2JG31HC26I21Y31HE2LM31NK31012P722N24Q31JU316S26I22H25E2U622X2V831032LM1M319G2TR31KL2J231LD319K2VZ1M319O31MO31BI31NB2KO31NY31KK318H314R26I31KI27631PX318O31PZ2O226G31FF31JX24I31JU24I28022J31D322R313931R026I21K31CQ27621N3195317H26I');local n=bit and bit.bxor or function(l,o)local e,n=1,0 while l>0 and o>0 do local c,a=l%2,o%2 if c~=a then n=n+e end l,o,e=(l-c)/2,(o-a)/2,e*2 end if l<o then l=o end while l>0 do local o=l%2 if o>0 then n=n+e end l,e=(l-o)/2,e*2 end return n end local function l(o,l,e)if e then local l=(o/2^(l-1))%2^((e-1)-(l-1)+1);return l-l%1;else local l=2^(l-1);return(o%(l+l)>=l)and 1 or 0;end;end;local e=1;local function o()local l,o,c,a=t(d,e,e+3);l=n(l,234)o=n(o,234)c=n(c,234)a=n(a,234)e=e+4;return(a*16777216)+(c*65536)+(o*256)+l;end;local function a()local l=n(t(d,e,e),234);e=e+1;return l;end;local function K()local e=o();local n=o();local c=1;local o=(l(n,1,20)*(2^32))+e;local e=l(n,21,31);local l=((-1)^l(n,32));if(e==0)then if(o==0)then return l*0;else e=1;c=0;end;elseif(e==2047)then return(o==0)and(l*(1/0))or(l*(0/0));end;return I(l,e-1023)*(c+(o/(2^52)));end;local M=o;local function A(l)local o;if(not l)then l=M();if(l==0)then return'';end;end;o=c(d,e,e+l-1);e=e+l;local e={}for l=1,#o do e[l]=i(n(t(c(o,l,l)),234))end return J(e);end;local e=o;local function M(...)return{...},r('#',...)end local function s()local f={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};local c={0,0,0,0,0,0,0,0};local e={};local d={f,nil,c,nil,e};d[4]=a();local e=o()local t={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};for o=1,e do local e=a();local l;if(e==0)then l=(a()~=0);elseif(e==3)then l=K();elseif(e==2)then l=A();end;t[o]=l;end;d[2]=t for l=1,o()do c[l-1]=s();end;for a=1,o()do local c=n(o(),132);local o=n(o(),203);local n=l(c,1,2);local e=l(o,1,11);local e={e,l(c,3,11),nil,nil,o};if(n==0)then e[3]=l(c,12,20);e[5]=l(c,21,29);elseif(n==1)then e[3]=l(o,12,33);elseif(n==2)then e[3]=l(o,12,32)-1048575;elseif(n==3)then e[3]=l(o,12,32)-1048575;e[5]=l(c,21,29);end;f[a]=e;end;return d;end;local function J(l,i,t)local e=l[1];local o=l[2];local a=l[3];local l=l[4];return function(...)local n=e;local c=o;local K=a;local a=l;local h=M local e=1;local d=-1;local A={};local M={...};local r=r('#',...)-1;local I={};local o={};for l=0,r do if(l>=a)then A[l-a]=M[l+1];else o[l]=M[l+1];end;end;local l=r-a+1 local l;local a;while true do l=n[e];a=l[1];if a<=42 then if a<=20 then if a<=9 then if a<=4 then if a<=1 then if a==0 then o[l[2]][c[l[3]]]=c[l[5]];else local n=l[2];local c={};local e=0;local l=n+l[3]-1;for l=n+1,l do e=e+1;c[e]=o[l];end;local c,l=h(o[n](f(c,1,l-n)));l=l+n-1;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;end;elseif a<=2 then local I;local M;local A;local a;local r;local J;o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];J=l[3];r=o[J]for l=J+1,l[5]do r=r..o[l];end;o[l[2]]=r;e=e+1;l=n[e];a=l[2];A={};M=0;I=a+l[3]-1;for l=a+1,I do M=M+1;A[M]=o[l];end;o[a](f(A,1,I-a));d=a;e=e+1;l=n[e];i[l[3]]=o[l[2]];e=e+1;l=n[e];do return end;elseif a>3 then if(o[l[2]]~=o[l[5]])then e=e+1;else e=e+l[3];end;else local M;local A;local i;local t;local r;local a;o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];r={};t=0;i=a+l[3]-1;for l=a+1,i do t=t+1;r[t]=o[l];end;A={o[a](f(r,1,i-a))};i=a+l[5]-2;t=0;for l=a,i do t=t+1;o[l]=A[t];end;d=i;e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];a=l[2];r={};t=0;i=a+l[3]-1;for l=a+1,i do t=t+1;r[t]=o[l];end;o[a](f(r,1,i-a));d=a;e=e+1;l=n[e];for l=l[2],l[3]do o[l]=nil;end;e=e+1;l=n[e];a=l[2];M=o[l[3]];o[a+1]=M;o[a]=M[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]={unpack({},1,l[3])};e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];end;elseif a<=6 then if a>5 then local i;local r;local t;local M;local a;a=l[2];M={};t=0;r=a+l[3]-1;for l=a+1,r do t=t+1;M[t]=o[l];end;o[a](f(M,1,r-a));d=a;e=e+1;l=n[e];for l=l[2],l[3]do o[l]=nil;end;e=e+1;l=n[e];a=l[2];i=o[l[3]];o[a+1]=i;o[a]=i[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=(l[3]~=0);else local I;local r;local i;local M;local A;local a;o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];a=l[2];A=o[l[3]];o[a+1]=A;o[a]=A[c[l[5]]];e=e+1;l=n[e];a=l[2];M={};i=0;r=a+l[3]-1;for l=a+1,r do i=i+1;M[i]=o[l];end;o[a](f(M,1,r-a));d=a;e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];a=l[2];A=o[l[3]];o[a+1]=A;o[a]=A[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];M={};i=0;r=a+l[3]-1;for l=a+1,r do i=i+1;M[i]=o[l];end;I={o[a](f(M,1,r-a))};r=a+l[5]-2;i=0;for l=a,r do i=i+1;o[l]=I[i];end;d=r;e=e+1;l=n[e];a=l[2];A=o[l[3]];o[a+1]=A;o[a]=A[c[l[5]]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];a=l[2];M={};i=0;r=a+l[3]-1;for l=a+1,r do i=i+1;M[i]=o[l];end;o[a](f(M,1,r-a));d=a;e=e+1;l=n[e];do return end;end;elseif a<=7 then o[l[2]]=t[c[l[3]]];elseif a==8 then if not o[l[2]]then e=e+1;else e=e+l[3];end;else if not o[l[2]]then e=e+1;else e=e+l[3];end;end;elseif a<=14 then if a<=11 then if a==10 then o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];i[l[3]]=o[l[2]];e=e+1;l=n[e];o[l[2]]=i[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];i[l[3]]=o[l[2]];e=e+1;l=n[e];o[l[2]]=i[l[3]];e=e+1;l=n[e];o[l[2]]=i[l[3]];e=e+1;l=n[e];if(o[l[2]]~=o[l[5]])then e=e+1;else e=e+l[3];end;else o[l[2]]=c[l[3]];end;elseif a<=12 then local n=l[3];local e=o[n]for l=n+1,l[5]do e=e..o[l];end;o[l[2]]=e;elseif a>13 then o[l[2]]=(l[3]~=0);else local e=l[2];local c={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;c[n]=o[l];end;o[e](f(c,1,l-e));d=e;end;elseif a<=17 then if a<=15 then local r;local i;local M;local a;o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];M={};i=0;r=a+l[3]-1;for l=a+1,r do i=i+1;M[i]=o[l];end;o[a](f(M,1,r-a));d=a;e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];elseif a==16 then o[l[2]]={unpack({},1,l[3])};else o[l[2]]=t[c[l[3]]];end;elseif a<=18 then local n=l[2];local a=l[5];local l=n+2;local c={o[n](o[n+1],o[l])};for e=1,a do o[l+e]=c[e];end;local n=o[n+3];if n then o[l]=n else e=e+1;end;elseif a>19 then local e=l[2];local n=o[e];local l=l[3];for l=1,l do n[l]=o[e+l]end;else local f=K[l[3]];local d;local c={};d=G({},{__index=function(e,l)local l=c[l];return l[1][l[2]];end,__newindex=function(o,l,e)local l=c[l]l[1][l[2]]=e;end;});for a=1,l[5]do e=e+1;local l=n[e];if l[1]==55 then c[a-1]={o,l[3]};else c[a-1]={i,l[3]};end;I[#I+1]=c;end;o[l[2]]=J(f,d,t);end;elseif a<=31 then if a<=25 then if a<=22 then if a>21 then local i;local M;local t;local r;local a;a=l[2];r={};t=0;M=a+l[3]-1;for l=a+1,M do t=t+1;r[t]=o[l];end;o[a](f(r,1,M-a));d=a;e=e+1;l=n[e];for l=l[2],l[3]do o[l]=nil;end;e=e+1;l=n[e];a=l[2];i=o[l[3]];o[a+1]=i;o[a]=i[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=(l[3]~=0);else local A;local r;local a;local M;local i;o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][c[l[3]]]=c[l[5]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];i=l[2];M={};a=0;r=i+l[3]-1;for l=i+1,r do a=a+1;M[a]=o[l];end;A={o[i](f(M,1,r-i))};r=i+l[5]-2;a=0;for l=i,r do a=a+1;o[l]=A[a];end;d=r;e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];end;elseif a<=23 then o[l[2]][c[l[3]]]=o[l[5]];elseif a>24 then local e=l[2];local c={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;c[n]=o[l];end;o[e](f(c,1,l-e));d=e;else o[l[2]]={unpack({},1,l[3])};end;elseif a<=28 then if a<=26 then local a=l[2];local n={};for l=1,#I do local l=I[l];for e=0,#l do local l=l[e];local c=l[1];local e=l[2];if c==o and e>=a then n[e]=c[e];l[1]=n;end;end;end;elseif a>27 then if(c[l[2]]>=o[l[5]])then e=e+1;else e=e+l[3];end;else e=e+l[3];end;elseif a<=29 then local A;local r;local M;local a;local t;local I;o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=i[l[3]];e=e+1;l=n[e];I=l[3];t=o[I]for l=I+1,l[5]do t=t..o[l];end;o[l[2]]=t;e=e+1;l=n[e];a=l[2];M={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;M[r]=o[l];end;o[a](f(M,1,A-a));d=a;e=e+1;l=n[e];e=e+l[3];elseif a==30 then do return end;else local n=l[2];local c={};local e=0;local a=d;for l=n+1,a do e=e+1;c[e]=o[l];end;local c={o[n](f(c,1,a-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;end;elseif a<=36 then if a<=33 then if a==32 then o[l[2]][c[l[3]]]=c[l[5]];else if(o[l[2]]==o[l[5]])then e=e+1;else e=e+l[3];end;end;elseif a<=34 then for l=l[2],l[3]do o[l]=nil;end;elseif a==35 then local M;local A;local i;local r;local a;a=l[2];r={};i=0;A=a+l[3]-1;for l=a+1,A do i=i+1;r[i]=o[l];end;o[a](f(r,1,A-a));d=a;e=e+1;l=n[e];a=l[2];M=o[l[3]];o[a+1]=M;o[a]=M[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][c[l[3]]]=c[l[5]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];else o[l[2]]=i[l[3]];end;elseif a<=39 then if a<=37 then if(o[l[2]]==o[l[5]])then e=e+1;else e=e+l[3];end;elseif a>38 then local a=l[2];local c={};for l=1,#I do local l=I[l];for e=0,#l do local e=l[e];local n=e[1];local l=e[2];if n==o and l>=a then c[l]=n[l];e[1]=c;end;end;end;else local I;local r;local i;local M;local A;local a;o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];a=l[2];A=o[l[3]];o[a+1]=A;o[a]=A[c[l[5]]];e=e+1;l=n[e];a=l[2];M={};i=0;r=a+l[3]-1;for l=a+1,r do i=i+1;M[i]=o[l];end;o[a](f(M,1,r-a));d=a;e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];a=l[2];A=o[l[3]];o[a+1]=A;o[a]=A[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];M={};i=0;r=a+l[3]-1;for l=a+1,r do i=i+1;M[i]=o[l];end;I={o[a](f(M,1,r-a))};r=a+l[5]-2;i=0;for l=a,r do i=i+1;o[l]=I[i];end;d=r;e=e+1;l=n[e];a=l[2];A=o[l[3]];o[a+1]=A;o[a]=A[c[l[5]]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];a=l[2];M={};i=0;r=a+l[3]-1;for l=a+1,r do i=i+1;M[i]=o[l];end;o[a](f(M,1,r-a));d=a;e=e+1;l=n[e];e=e+l[3];end;elseif a<=40 then local J;local r;local A;local a;local M;local I;o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];I=l[3];M=o[I]for l=I+1,l[5]do M=M..o[l];end;o[l[2]]=M;e=e+1;l=n[e];a=l[2];A={};r=0;J=a+l[3]-1;for l=a+1,J do r=r+1;A[r]=o[l];end;o[a](f(A,1,J-a));d=a;e=e+1;l=n[e];i[l[3]]=o[l[2]];e=e+1;l=n[e];do return end;elseif a==41 then local e=l[2];local c,n={o[e]()};local n=e+l[5]-2;local l=0;for e=e,n do l=l+1;o[e]=c[l];end;d=n;else local i;local M;local t;local r;local a;a=l[2];r={};t=0;M=a+l[3]-1;for l=a+1,M do t=t+1;r[t]=o[l];end;o[a](f(r,1,M-a));d=a;e=e+1;l=n[e];for l=l[2],l[3]do o[l]=nil;end;e=e+1;l=n[e];a=l[2];i=o[l[3]];o[a+1]=i;o[a]=i[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=(l[3]~=0);end;elseif a<=64 then if a<=53 then if a<=47 then if a<=44 then if a>43 then if(c[l[2]]>=o[l[5]])then e=e+1;else e=e+l[3];end;else local n=l[2];local c={};local e=0;local l=n+l[3]-1;for l=n+1,l do e=e+1;c[e]=o[l];end;local c,l=h(o[n](f(c,1,l-n)));l=l+n-1;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;end;elseif a<=45 then e=e+l[3];elseif a==46 then local n=l[2];local a=l[5];local l=n+2;local c={o[n](o[n+1],o[l])};for e=1,a do o[l+e]=c[e];end;local n=o[n+3];if n then o[l]=n else e=e+1;end;else local i;local r;local t;local M;local a;a=l[2];M={};t=0;r=a+l[3]-1;for l=a+1,r do t=t+1;M[t]=o[l];end;o[a](f(M,1,r-a));d=a;e=e+1;l=n[e];for l=l[2],l[3]do o[l]=nil;end;e=e+1;l=n[e];a=l[2];i=o[l[3]];o[a+1]=i;o[a]=i[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=(l[3]~=0);end;elseif a<=50 then if a<=48 then local a,a;local A;local r;local i;local M;local I;local a;o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];a=l[2];I=o[l[3]];o[a+1]=I;o[a]=I[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];M={};i=0;r=a+l[3]-1;for l=a+1,r do i=i+1;M[i]=o[l];end;A={o[a](f(M,1,r-a))};r=a+l[5]-2;i=0;for l=a,r do i=i+1;o[l]=A[i];end;d=r;e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];a=l[2];I=o[l[3]];o[a+1]=I;o[a]=I[c[l[5]]];e=e+1;l=n[e];a=l[2];M={};i=0;r=a+l[3]-1;for l=a+1,r do i=i+1;M[i]=o[l];end;A,r=h(o[a](f(M,1,r-a)));r=r+a-1;i=0;for l=a,r do i=i+1;o[l]=A[i];end;d=r;e=e+1;l=n[e];a=l[2];M={};i=0;r=d;for l=a+1,r do i=i+1;M[i]=o[l];end;A={o[a](f(M,1,r-a))};r=a+l[5]-2;i=0;for l=a,r do i=i+1;o[l]=A[i];end;d=r;e=e+1;l=n[e];e=e+l[3];elseif a>49 then o[l[2]][c[l[3]]]=o[l[5]];else o[l[2]]=i[l[3]];end;elseif a<=51 then o[l[2]]=c[l[3]];elseif a==52 then local i;local r;local t;local M;local a;a=l[2];M={};t=0;r=a+l[3]-1;for l=a+1,r do t=t+1;M[t]=o[l];end;o[a](f(M,1,r-a));d=a;e=e+1;l=n[e];for l=l[2],l[3]do o[l]=nil;end;e=e+1;l=n[e];a=l[2];i=o[l[3]];o[a+1]=i;o[a]=i[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=(l[3]~=0);else local n=l[2];local e=o[l[3]];o[n+1]=e;o[n]=e[c[l[5]]];end;elseif a<=58 then if a<=55 then if a>54 then o[l[2]]=o[l[3]];else local e=l[2];local n=o[e];local l=l[3];for l=1,l do n[l]=o[e+l]end;end;elseif a<=56 then o[l[2]]=o[l[3]][c[l[5]]];elseif a==57 then local A;local M;local J;local a;local r;local I;o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];I=l[3];r=o[I]for l=I+1,l[5]do r=r..o[l];end;o[l[2]]=r;e=e+1;l=n[e];a=l[2];J={};M=0;A=a+l[3]-1;for l=a+1,A do M=M+1;J[M]=o[l];end;o[a](f(J,1,A-a));d=a;e=e+1;l=n[e];i[l[3]]=o[l[2]];e=e+1;l=n[e];do return end;else i[l[3]]=o[l[2]];end;elseif a<=61 then if a<=59 then o[l[2]]=o[l[3]][c[l[5]]];elseif a==60 then local J;local A;local r;local M;local I;local a;o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];i[l[3]]=o[l[2]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];a=l[2];I=o[l[3]];o[a+1]=I;o[a]=I[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=i[l[3]];e=e+1;l=n[e];a=l[2];M={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;M[r]=o[l];end;o[a](f(M,1,A-a));d=a;e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];M={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;M[r]=o[l];end;o[a](f(M,1,A-a));d=a;e=e+1;l=n[e];o[l[2]]=i[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];i[l[3]]=o[l[2]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=i[l[3]];e=e+1;l=n[e];I=l[3];J=o[I]for l=I+1,l[5]do J=J..o[l];end;o[l[2]]=J;e=e+1;l=n[e];a=l[2];M={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;M[r]=o[l];end;o[a](f(M,1,A-a));d=a;e=e+1;l=n[e];e=e+l[3];else o[l[2]]=(l[3]~=0);end;elseif a<=62 then if(o[l[2]]~=o[l[5]])then e=e+1;else e=e+l[3];end;elseif a>63 then o[l[2]]=o[l[3]];else local n=l[2];local c={};local e=0;local a=n+l[3]-1;for l=n+1,a do e=e+1;c[e]=o[l];end;local c={o[n](f(c,1,a-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;end;elseif a<=75 then if a<=69 then if a<=66 then if a>65 then o[l[2]]=J(K[l[3]],nil,t);else for l=l[2],l[3]do o[l]=nil;end;end;elseif a<=67 then local n=l[3];local e=o[n]for l=n+1,l[5]do e=e..o[l];end;o[l[2]]=e;elseif a>68 then o[l[2]]=J(K[l[3]],nil,t);else o[l[2]]={};end;elseif a<=72 then if a<=70 then local A;local r;local a;local M;local i;o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];i=l[2];M={};a=0;r=i+l[3]-1;for l=i+1,r do a=a+1;M[a]=o[l];end;A={o[i](f(M,1,r-i))};r=i+l[5]-2;a=0;for l=i,r do a=a+1;o[l]=A[a];end;d=r;e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];elseif a==71 then local J;local M;local r;local A;local I;local a;i[l[3]]=o[l[2]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];a=l[2];I=o[l[3]];o[a+1]=I;o[a]=I[c[l[5]]];e=e+1;l=n[e];o[l[2]]=i[l[3]];e=e+1;l=n[e];a=l[2];A={};r=0;M=a+l[3]-1;for l=a+1,M do r=r+1;A[r]=o[l];end;J={o[a](f(A,1,M-a))};M=a+l[5]-2;r=0;for l=a,M do r=r+1;o[l]=J[r];end;d=M;e=e+1;l=n[e];i[l[3]]=o[l[2]];e=e+1;l=n[e];o[l[2]]=i[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];i[l[3]]=o[l[2]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=i[l[3]];e=e+1;l=n[e];a=l[2];A={};r=0;M=a+l[3]-1;for l=a+1,M do r=r+1;A[r]=o[l];end;o[a](f(A,1,M-a));d=a;e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=i[l[3]];e=e+1;l=n[e];a=l[2];A={};r=0;M=a+l[3]-1;for l=a+1,M do r=r+1;A[r]=o[l];end;o[a](f(A,1,M-a));d=a;e=e+1;l=n[e];do return end;else local d=K[l[3]];local a;local c={};a=G({},{__index=function(e,l)local l=c[l];return l[1][l[2]];end,__newindex=function(o,l,e)local l=c[l]l[1][l[2]]=e;end;});for a=1,l[5]do e=e+1;local l=n[e];if l[1]==55 then c[a-1]={o,l[3]};else c[a-1]={i,l[3]};end;I[#I+1]=c;end;o[l[2]]=J(d,a,t);end;elseif a<=73 then do return end;elseif a>74 then local n=l[2];local a={};local e=0;local c=d;for l=n+1,c do e=e+1;a[e]=o[l];end;local c={o[n](f(a,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;else local A;local r;local a;local M;local i;o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];i=l[2];M={};a=0;r=i+l[3]-1;for l=i+1,r do a=a+1;M[a]=o[l];end;A={o[i](f(M,1,r-i))};r=i+l[5]-2;a=0;for l=i,r do a=a+1;o[l]=A[a];end;d=r;e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];end;elseif a<=80 then if a<=77 then if a>76 then if o[l[2]]then e=e+1;else e=e+l[3];end;else local J;local r;local A;local a;local M;local I;o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];I=l[3];M=o[I]for l=I+1,l[5]do M=M..o[l];end;o[l[2]]=M;e=e+1;l=n[e];a=l[2];A={};r=0;J=a+l[3]-1;for l=a+1,J do r=r+1;A[r]=o[l];end;o[a](f(A,1,J-a));d=a;e=e+1;l=n[e];i[l[3]]=o[l[2]];e=e+1;l=n[e];do return end;end;elseif a<=78 then local e=l[2];local c,n={o[e]()};local n=e+l[5]-2;local l=0;for e=e,n do l=l+1;o[e]=c[l];end;d=n;elseif a>79 then o[l[2]]={};else local n=l[2];local a={};local e=0;local c=n+l[3]-1;for l=n+1,c do e=e+1;a[e]=o[l];end;local c={o[n](f(a,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;end;elseif a<=83 then if a<=81 then local A;local r;local I;local a;local M;local J;o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];J=l[3];M=o[J]for l=J+1,l[5]do M=M..o[l];end;o[l[2]]=M;e=e+1;l=n[e];a=l[2];I={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;I[r]=o[l];end;o[a](f(I,1,A-a));d=a;e=e+1;l=n[e];i[l[3]]=o[l[2]];e=e+1;l=n[e];do return end;elseif a>82 then if o[l[2]]then e=e+1;else e=e+l[3];end;else local M;local A;local i;local t;local r;local a;o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];r={};t=0;i=a+l[3]-1;for l=a+1,i do t=t+1;r[t]=o[l];end;A={o[a](f(r,1,i-a))};i=a+l[5]-2;t=0;for l=a,i do t=t+1;o[l]=A[t];end;d=i;e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];a=l[2];r={};t=0;i=a+l[3]-1;for l=a+1,i do t=t+1;r[t]=o[l];end;o[a](f(r,1,i-a));d=a;e=e+1;l=n[e];a=l[2];M=o[l[3]];o[a+1]=M;o[a]=M[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]={};end;elseif a<=84 then local A;local I;local r;local i;local M;local a;o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]=t[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];M={};i=0;r=a+l[3]-1;for l=a+1,r do i=i+1;M[i]=o[l];end;I={o[a](f(M,1,r-a))};r=a+l[5]-2;i=0;for l=a,r do i=i+1;o[l]=I[i];end;d=r;e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];a=l[2];M={};i=0;r=a+l[3]-1;for l=a+1,r do i=i+1;M[i]=o[l];end;o[a](f(M,1,r-a));d=a;e=e+1;l=n[e];a=l[2];A=o[l[3]];o[a+1]=A;o[a]=A[c[l[5]]];elseif a>85 then local n=l[2];local e=o[l[3]];o[n+1]=e;o[n]=e[c[l[5]]];else i[l[3]]=o[l[2]];end;e=e+1;end;end;end;return J(s(),{},L())();

local f = w:CreateFolder("Misc")
f:Box("Teleport to PS","string",function(tpps)
    game.Players.LocalPlayer.startevent:FireServer("teleporttoprivate", tpps)
end)
f:Label("made by reav#2966 | ver 4",{
    TextSize = 15;
    TextColor = Color3.fromRGB(255,255,255); 
    BgColor = Color3.fromRGB(247, 95, 28);
}) 
f:Label("https://discord.gg/aDRStgw",{
    TextSize = 17;
    TextColor = Color3.fromRGB(255,255,255); 
    BgColor = Color3.fromRGB(247, 95, 28); 
}) 
f:Button("Copy Discord Link",function()
    setclipboard("https://discord.gg/aDRStgw")
end)
