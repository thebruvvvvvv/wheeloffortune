SMODS.Joker{ --Cellar Growth
    key = "cellargrowth",
    config = {
        extra = {
            CellarGrowthSize = 1,
            odds = 8
        }
    },
    loc_txt = {
        ['name'] = 'Cellar Growth',
        ['text'] = {
            [1] = '#1# in 8 chance of {C:red}self-destructing{}.',
            [2] = 'Gives X#1# {C:blue}Chips{}',
            [3] = '{C:attention}Both {}{C:green}chance {}of {C:red}self-destructing {}{C:attention}and {}{X:blue,C:white}XChips{} increase by one',
            [4] = 'when a blind is skipped.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["wheeloffortune_wheeloffortune_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.CellarGrowthSize, card.ability.extra.odds, 'j_wheeloffortune_cellargrowth') 
        return {vars = {card.ability.extra.CellarGrowthSize, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_624dccf3', 1, card.ability.extra.odds, 'j_wheeloffortune_cellargrowth', false) then
                    SMODS.calculate_effect({func = function()
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
                    end}, card)
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.CellarGrowthSize
            }
        end
        if context.skip_blind  then
            return {
                func = function()
                    card.ability.extra.CellarGrowthSize = (card.ability.extra.CellarGrowthSize) + 1
                    return true
                end
            }
        end
    end
}