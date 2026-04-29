SMODS.Booster {
    key = 'deposit_pack',
    loc_txt = {
        name = "Deposit Pack",
        text = {
            [1] = 'Select 1 out of 3 {C:mineral}Mineral{} cards to use.'
        },
        group_name = "Choose 1 out of 3 Mineral cards to use."
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            2.95,
            0.05
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('wheeloffortune_deposit_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "mineral",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "wheeloffortune_deposit_pack"
            }
        elseif selected_index == 2 then
            return {
                key = "c_wheeloffortune_luminite",
                set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "wheeloffortune_deposit_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("786182"))
        ease_background_colour({ new_colour = HEX('786182'), special_colour = HEX("786182"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}

SMODS.Booster {
    key = 'deposit_pack2',
    loc_txt = {
        name = "Deposit Pack",
        text = {
            [1] = 'Select 1 out of 3 {C:mineral}Mineral{} cards to use.'
        },
        group_name = "Deposit Pack"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    kind = 'Mineral',
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            2.95,
            0.05
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('wheeloffortune_deposit_pack2_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "mineral",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "wheeloffortune_deposit_pack2"
            }
        elseif selected_index == 2 then
            return {
                key = "c_wheeloffortune_luminite",
                set = "Spectral",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "wheeloffortune_deposit_pack2"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("786182"))
        ease_background_colour({ new_colour = HEX('786182'), special_colour = HEX("786182"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}

SMODS.Booster {
    key = 'jumbo_deposit_pack',
    loc_txt = {
        name = "Jumbo Deposit Pack",
        text = {
            [1] = 'Select 1 out of 5 {C:mineral}Mineral{} cards to use.'
        },
        group_name = "Jumbo Deposit Pack"
    },
    config = { extra = 5, choose = 1 },
    cost = 8,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            2.95,
            0.05
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('wheeloffortune_jumbo_deposit_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "mineral",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "wheeloffortune_jumbo_deposit_pack"
            }
        elseif selected_index == 2 then
            return {
                key = "c_wheeloffortune_luminite",
                set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "wheeloffortune_jumbo_deposit_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("786182"))
        ease_background_colour({ new_colour = HEX('786182'), special_colour = HEX("786182"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'mega_deposit_pack',
    loc_txt = {
        name = "Mega Deposit Pack",
        text = {
            [1] = 'Pick 2 out of 5 {C:mineral}Mineral{}cards to be used.'
        },
        group_name = "Mega Deposit Pack"
    },
    config = { extra = 5, choose = 2 },
    cost = 12,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            2.95,
            0.05
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('wheeloffortune_mega_deposit_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "mineral",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "wheeloffortune_mega_deposit_pack"
            }
        elseif selected_index == 2 then
            return {
                key = "c_wheeloffortune_luminite",
                set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "wheeloffortune_mega_deposit_pack"
            }
        end
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}
