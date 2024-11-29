-- Lắng nghe sự kiện người chơi gia nhập game
game.Players.PlayerAdded:Connect(function(player)
    -- Kiểm tra tên người chơi
    if player.Name == "khua1121" then
        -- Khi nhân vật của "khua1121" xuất hiện
        player.CharacterAdded:Connect(function(character)
            -- Lấy Humanoid trong nhân vật
            local humanoid = character:WaitForChild("Humanoid")
            
            -- Tăng tốc độ chạy lên 30 lần (tốc độ mặc định là 16, tăng lên 480)
            humanoid.WalkSpeed = 16 * 30  -- Tốc độ chạy của "khua1121" sẽ là 480

            -- Thêm hiệu ứng phân biệt (Ví dụ: thay đổi màu sắc nhân vật để nổi bật)
            local characterAppearance = character:FindFirstChild("Head")
            if characterAppearance then
                characterAppearance.BrickColor = BrickColor.new("Bright blue")  -- Thay đổi màu sắc đầu nhân vật
            end
            
            -- Thêm vệt sáng phía sau nhân vật để tạo hiệu ứng chạy nhanh
            local trail = Instance.new("Trail")
            trail.Lifetime = 0.5  -- Thời gian hiệu ứng vệt sáng
            trail.Parent = character.HumanoidRootPart
            trail.Attachment0 = character.HumanoidRootPart:FindFirstChild("Attachment") or Instance.new("Attachment", character.HumanoidRootPart)
        end)
    else
        -- Đặt tốc độ mặc định cho các người chơi khác
        player.CharacterAdded:Connect(function(character)
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.WalkSpeed = 16  -- Tốc độ mặc định cho người chơi khác
        end)
    end
end)
