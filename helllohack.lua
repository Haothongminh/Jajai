-- Tăng tốc độ chạy cho nhân vật
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Tăng tốc độ chạy
humanoid.WalkSpeed = 100 -- Giá trị mặc định là 16, bạn có thể điều chỉnh theo ý muốn
