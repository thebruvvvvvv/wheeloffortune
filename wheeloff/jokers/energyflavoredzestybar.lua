
SMODS.Joker{ --Energy Flavored Zesty Bar
    key = "energyflavoredzestybar",
    config = {
        extra = {
            discards0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Energy Flavored Zesty Bar',
        ['text'] = {
            [1] = 'When {C:attention}Blind {}is selected, gain {C:red}+1{} {C:red}Discard{}.',
            [2] = '{C:red}Destroyed {}if {C:attention}Blind{} is cleared with {C:red}0 Discards.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["wheeloffortune_wheeloffortune_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Discards", colour = G.C.GREEN})
                    
                    G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
                    return true
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big(G.GAME.current_round.discards_left) == to_big(10) then
                return {
                    func = function()
                        local target_joker = card
                        
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
            end
        end
    end
}