-- Carrega a Biblioteca de Interface Rayfield (Muito mais estável para celular)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()

-- Cria a Janela Principal (Preto, Azul e Branco)
local Window = Rayfield:CreateWindow({
   Name = "🌌 Nebula Hub | Blox Fruits",
   LoadingTitle = "Carregando Nebula Hub...",
   LoadingSubtitle = "by Arthur Vilhena",
   ConfigurationSaving = {
      Enabled = false
   },
   KeySystem = false -- Sem Key!
})

-- Criando as Variáveis de Controle
getgenv().AutoFarm = false
getgenv().AutoSpend = false
getgenv().AutoClick = false

-- Criando as Abas no Menu
local FarmTab = Window:CreateTab("Auto Farm", 4483345998)
local ShopTab = Window:CreateTab("Loja do Evento", 4483345998)

-- ==================== ABA: AUTO FARM ====================

FarmTab:CreateToggle({
   Name = "Iniciar Auto Farm",
   CurrentValue = false,
   Flag = "ToggleAutoFarm",
   Callback = function(Value)
      getgenv().AutoFarm = Value
      if Value then
          runAutoFarm()
      end
   end,
})

FarmTab:CreateToggle({
   Name = "Ativar Clique Rápido",
   CurrentValue = false,
   Flag = "ToggleAutoClick",
   Callback = function(Value)
      getgenv().AutoClick = Value
      if Value then
          runAutoClick()
      end
   end,
})

-- ==================== ABA: LOJA DO EVENTO ====================

ShopTab:CreateToggle({
   Name = "Gastar Moedas Automaticamente",
   CurrentValue = false,
   Flag = "ToggleAutoSpend",
   Callback = function(Value)
      getgenv().AutoSpend = Value
      if Value then
          runAutoSpend()
      end
   end,
})

-- ==================== FUNÇÕES LÓGICAS DO SCRIPT ====================

function runAutoFarm()
    task.spawn(function()
        local player = game.Players.LocalPlayer
        while getgenv().AutoFarm do
            task.wait(1)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "MagnetEventQuest1", 1)
            for _, npc in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if npc.Name == "Magnet Bandit" and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
                    while npc.Humanoid.Health > 0 and getgenv().AutoFarm do
                        task.wait()
                        local character = player.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                        end
                    end
                end
            end
        end
    end)
end

function runAutoClick()
    task.spawn(function()
        local virtualUser = game:GetService("VirtualUser")
        while getgenv().AutoClick do
            task.wait(0.1)
            virtualUser:CaptureController()
            virtualUser:Button1Down(Vector2.new(0,0), game.Workspace.CurrentCamera.CFrame)
        end
    end)
end

function runAutoSpend()
    task.spawn(function()
        while getgenv().AutoSpend do
            task.wait(2) 
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyMagnetGacha", "MainStore")
        end
    end)
end

