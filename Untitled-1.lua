repeat wait() until game:IsLoaded() wait()
   game:GetService("Players").LocalPlayer.Idled:connect(function()
   game:GetService("VirtualUser"):ClickButton2(Vector2.new())
   end)

   if game.PlaceId == 648362523 then
      repeat wait() until game:IsLoaded()
         game.StarterGui:SetCore(
         "SendNotification",
         {
            Title = "Credis",
            Text = "IsaaaKK#9010, DekuDimz, valor#7303"
         }
         )
         Clone = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:Clone()
         game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:Destroy()
         Clone.Parent = game:GetService("Players").LocalPlayer.Character
         game.Players.LocalPlayer.settings["Display Gun"].Value = true
         game.Players.LocalPlayer.CharacterAdded:Connect(
         function()
            if getgenv().AutoFarm then
               pcall(function()
               game.Players.LocalPlayer.settings["Display Gun"].Value = true
               wait(4)
               Clone = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:Clone()
               game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:Destroy()
               Clone.Parent = game:GetService("Players").LocalPlayer.Character
               end)
            end
         end
         )

         while getgenv().AutoFarm do
            pcall(function()
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "public")
            end)
            wait()
            for i, v in pairs(game.Players:GetPlayers()) do
               if v.Name == game.Players.LocalPlayer.Name then
               else
                  pcall(function()
                  game:GetService("ReplicatedStorage").RemoteEvent:FireServer(30, v)
                  end)
               end
            end
         end
      else
         game:GetService("TeleportService"):Teleport(648362523, LocalPlayer)
      end

      function hop()
         pcall(function()
         local Servers = game.HttpService:JSONDecode(game:HttpGet(
         "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
         spawn(function()
         while wait(1) do
            for i, v in pairs(Servers.data) do
               if v.playing ~= v.maxPlayers then
                  wait(1.5)
                  game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
               end
            end
         end
         end)
         end)
      end

      local players = game.Players:GetChildren()
      local countPlayers = #players

      local buyers = 0
      local suggarAmount = 0
      for i, v in pairs(game:GetService("Players"):GetChildren()) do
         for i, v in pairs(v:GetDescendants()) do
            if v.Name == "Bought" then
               if v.Value > 0 then
                  buyers = buyers + 1
               end

               if LookForSuggarDad then
                  if v.Value > minSuggardad then
                     suggarAmount = suggarAmount + 1
                  end
               end
            end
         end
      end

      if countPlayers >= minPlayers and buyers >= minBuyers then
         if LookForSuggarDad then
            if suggarAmount > 0 then
               local waitTime = serverHopAfterMinutes * 60
               local client = game.GetService(game, "Players").LocalPlayer

               for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
                  v:Disable()
               end
               wait(waitTime)
               hop();
            else
               hop();
            end
         else
            local waitTime = serverHopAfterMinutes * 60
            local client = game.GetService(game, "Players").LocalPlayer

            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
               v:Disable()
            end
            wait(waitTime)
            hop();
         end
      else
         hop();
      end
   end