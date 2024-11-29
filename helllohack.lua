game.Players.PlayerAdded:Connect(function(player)
    -- Kiểm tra tên người chơi
    if player.Name == "khua1121" then
        -- Khi nhân vật của "khua1121" xuất hiện
        player.CharacterAdded:Connect(function(character)
            -- Kiểm tra xem nhân vật có Humanoid không
            local humanoid = character:WaitForChild("Humanoid")
            if humanoid then
                -- Tăng tốc độ chạy lên 30 lần (tốc độ mặc định là 16, tăng lên 480)
                humanoid.WalkSpeed = 16 * 30  -- Tốc độ chạy của "khua1121" sẽ là 480

                -- Thêm hiệu ứng phân biệt (Ví dụ: thay đổi màu sắc đầu nhân vật để nổi bật)
                local characterAppearance = character:FindFirstChild("Head")
                if characterAppearance then
                    characterAppearance.BrickColor = BrickColor.new("Bright blue")  -- Thay đổi màu sắc đầu nhân vật
                else
                    warn("Không tìm thấy đầu nhân vật của " .. player.Name)
                end

                -- Thêm vệt sáng phía sau nhân vật để tạo hiệu ứng chạy nhanh
                local trail = Instance.new("Trail")
                trail.Lifetime = 0.5  -- Thời gian hiệu ứng vệt sáng
                trail.Parent = character.HumanoidRootPart  -- Gắn vệt sáng vào HumanoidRootPart

                -- Kiểm tra và tạo attachment nếu không có
                local attachment = character.HumanoidRootPart:FindFirstChild("Attachment")
                if not attachment then
                    attachment = Instance.new("Attachment")
                    attachment.Parent = character.HumanoidRootPart
                end
                trail.Attachment0 = attachment  -- Gắn vệt sáng vào attachment
            else
                warn("Không tìm thấy Humanoid trong nhân vật của " .. player.Name)
            end
        end)
    else
        -- Đặt tốc độ mặc định cho các người chơi khác
        player.CharacterAdded:Connect(function(character)
            local humanoid = character:WaitForChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16  -- Tốc độ mặc định cho người chơi khác
            else
                warn("Không tìm thấy Humanoid trong nhân vật của " .. player.Name)
            end
        end)
    end
end)
