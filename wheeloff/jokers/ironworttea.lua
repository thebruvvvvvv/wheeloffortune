
SMODS.Joker{ --Ironwort Tea
    key = "ironworttea",
    config = {
        extra = {
            XmultIronwortTea = 2
        }
    },
    loc_txt = {
        ['name'] = 'Ironwort Tea',
        ['text'] = {
            [1] = 'It\'s minty!',
            [2] = 'Gives X#1# {C:blue}Chips{}, amount decreases by {X:blue,C:white}X0.1{} every hand.',
            [3] = 'Self-destructs at {X:blue,C:white}X1{} {C:blue}Chips{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["wheeloffortune_wheeloff_jokers"] = true, ["wheeloffortune_drinks"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.XmultIronwortTea}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.XmultIronwortTea
            }
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.XmultIronwortTea or 0)) == to_big(1) then
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
                        card.ability.extra.XmultIronwortTea = math.max(0, (card.ability.extra.XmultIronwortTea) - 0.1)
                        return true
                    end
                }
            end
        end
    end
}