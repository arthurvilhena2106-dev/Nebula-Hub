-- Carrega a Biblioteca de Interface Visual (Orion Library)
-- Carrega a Biblioteca de Interface Visual Atualizada (Orion Library)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

-- Customização de Cores (Preto, Azul e Branco)
OrionLib.Themes = {
    Default = {
        Main = Color3.fromRGB(15, 15, 15),       -- Fundo Principal (Preto Escuro)
        Second = Color3.fromRGB(25, 25, 25),     -- Fundo Secundário (Preto)
        Stroke = Color3.fromRGB(0, 102, 255),    -- Bordas (Azul Neon)
        Divider = Color3.fromRGB(0, 102, 255),   -- Linhas Divisórias (Azul)
        Text = Color3.fromRGB(255, 255, 255),    -- Texto Geral (Branco)
        TextLight = Color3.fromRGB(200, 200, 200),-- Texto Secundário (Branco Fosco)
        TextColor = Color3.fromRGB(255, 255, 255),-- Texto dos Botões (Branco)
        SelectedTab = Color3.fromRGB(0, 102, 255),-- Aba Selecionada (Azul)
        Tab = Color3.fromRGB(150, 150, 150),     -- Aba Não Selecionada (Cinza Claro)
        Toggle = Color3.fromRGB(0, 102, 255),    -- Botão Ativado (Azul)
        ToggleDisabled = Color3.fromRGB(40, 40, 40) -- Botão Desativado (Preto Fosco)
    }
}

-- Cria a Janela Principal com o Novo Nome e Tema
local Window = OrionLib:MakeWindow({
    Name = "🌌 Nebula Hub | Blox Fruits", 
    HidePremium = true, 
    SaveConfig = false, 
    IntroText = "Carregando Nebula Hub..."
})

-- Criando as Variáveis de Controle (Ligar/Desligar)
getgenv().AutoFarm = false
getgenv().AutoSpend = false
getgenv().AutoClick = false

-- Criando as Abas no Menu
local FarmTab = Window:MakeTab({ Name = "Auto Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local ShopTab = Window:MakeTab({ Name = "Loja do Evento", Icon = "rbxassetid://4483345998", PremiumOnly = false })

-- ==================== ABA: AUTO FARM ====================

FarmTab:AddToggle({
    Name = "Iniciar Auto Farm",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarm = Value
        if Value then
            runAutoFarm()
        end
    end    
})

FarmTab:AddToggle({
    Name = "Ativar Clique Rápido",
    Default = false,
    Callback = function(Value)
        getgenv().AutoClick = Value
        if Value then
            runAutoClick()
        end
    end    
})

-- ==================== ABA: LOJA DO EVENTO ====================

ShopTab:AddToggle({
    Name = "Gastar Moedas Automaticamente",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSpend = Value
        if Value then
            runAutoSpend()
        end
    end    
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

OrionLib:Init()


-- Customização de Cores (Preto, Azul e Branco)
OrionLib.Themes = {
    Default = {
        Main = Color3.fromRGB(15, 15, 15),       -- Fundo Principal (Preto Escuro)
        Second = Color3.fromRGB(25, 25, 25),     -- Fundo Secundário (Preto)
        Stroke = Color3.fromRGB(0, 102, 255),    -- Bordas (Azul Neon)
        Divider = Color3.fromRGB(0, 102, 255),   -- Linhas Divisórias (Azul)
        Text = Color3.fromRGB(255, 255, 255),    -- Texto Geral (Branco)
        TextLight = Color3.fromRGB(200, 200, 200),-- Texto Secundário (Branco Fosco)
        TextColor = Color3.fromRGB(255, 255, 255),-- Texto dos Botões (Branco)
        SelectedTab = Color3.fromRGB(0, 102, 255),-- Aba Selecionada (Azul)
        Tab = Color3.fromRGB(150, 150, 150),     -- Aba Não Selecionada (Cinza Claro)
        Toggle = Color3.fromRGB(0, 102, 255),    -- Botão Ativado (Azul)
        ToggleDisabled = Color3.fromRGB(40, 40, 40) -- Botão Desativado (Preto Fosco)
    }
}

-- Cria a Janela Principal com o Novo Nome e Tema
local Window = OrionLib:MakeWindow({
    Name = "🌌 Nebula Hub | Blox Fruits", 
    HidePremium = true, 
    SaveConfig = false, 
    IntroText = "Carregando Nebula Hub..."
})

-- Criando as Variáveis de Controle (Ligar/Desligar)
getgenv().AutoFarm = false
getgenv().AutoSpend = false
getgenv().AutoClick = false

-- Criando as Abas no Menu
local FarmTab = Window:MakeTab({ Name = "Auto Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local ShopTab = Window:MakeTab({ Name = "Loja do Evento", Icon = "rbxassetid://4483345998", PremiumOnly = false })

-- ==================== ABA: AUTO FARM ====================

FarmTab:AddToggle({
    Name = "Iniciar Auto Farm",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarm = Value
        if Value then
            runAutoFarm()
        end
    end    
})

FarmTab:AddToggle({
    Name = "Ativar Clique Rápido",
    Default = false,
    Callback = function(Value)
        getgenv().AutoClick = Value
        if Value then
            runAutoClick()
        end
    end    
})

-- ==================== ABA: LOJA DO EVENTO ====================

ShopTab:AddToggle({
    Name = "Gastar Moedas Automaticamente",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSpend = Value
        if Value then
            runAutoSpend()
        end
    end    
})

-- ==================== FUNÇÕES LÓGICAS DO SCRIPT ====================

-- 1. Função do Auto Farm (Teleporte e Missão corrigidos)
function runAutoFarm()
    task.spawn(function()
        local player = game.Players.LocalPlayer
        
        while getgenv().AutoFarm do
            task.wait(1)
            
            -- Pega a missão automaticamente no servidor
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "MagnetEventQuest1", 1)
            
            -- Procura os inimigos no mapa
            for _, npc in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if npc.Name == "Magnet Bandit" and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
                    
                    while npc.Humanoid.Health > 0 and getgenv().AutoFarm do
                        task.wait()
                        local character = player.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            -- Teleporta e fica flutuando 5 blocos acima do inimigo com segurança
                            character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                        end
                    end
                end
            end
        end
    end)
end

-- 2. Função do Auto Clicker
function runAutoClick()
    task.spawn(function()
        local virtualUser = game:GetService("VirtualUser")
        while getgenv().AutoClick do
            task.wait(0.1) -- Clica a cada 0.1 segundos
            virtualUser:CaptureController()
            virtualUser:Button1Down(Vector2.new(0,0), game.Workspace.CurrentCamera.CFrame)
        end
    end)
end

-- 3. Função de Gastar Moedas
function runAutoSpend()
    task.spawn(function()
        while getgenv().AutoSpend do
            task.wait(2) 
            -- Envia o comando de compra para a loja do jogo
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyMagnetGacha", "MainStore")
        end
    end)
end

-- Inicializa o menu na tela
OrionLib:Init()
