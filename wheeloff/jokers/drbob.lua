
SMODS.Joker{ --Dr. Bob
    key = "drbob",
    config = {
        extra = {
            DrBobXMult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Dr. Bob',
        ['text'] = {
            [1] = 'Gives X#1# {C:red}Mult{}. Decreases by 0.1 every hand scored,',
            [2] = '{C:red}self-destructs{} at {X:red,C:white}X1{} Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["wheeloffortune_wheeloff_jokers"] = true, ["wheeloffortune_drinks"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.DrBobXMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.DrBobXMult
            }
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.DrBobXMult or 0)) == to_big(1) then
                return {
                    func = function()
                        local destructable_jokers = {}
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                table.insert(destructable_jokers, joker)
                            end
                        end
                        local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            else
                return {
                    func = function()
                        card.ability.extra.DrBobXMult = math.max(0, (card.ability.extra.DrBobXMult) - 0.1)
                        return true
                    end
                }
            end
        end
    end
}