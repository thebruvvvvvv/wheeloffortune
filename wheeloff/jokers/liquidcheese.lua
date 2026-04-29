
SMODS.Joker{ --Liquid Cheese
    key = "liquidcheese",
    config = {
        extra = {
            FondueCardsLiquidCheese = 3
        }
    },
    loc_txt = {
        ['name'] = 'Liquid Cheese',
        ['text'] = {
            [1] = 'Converts scored cards to a {C:enhanced}Fondue {}card.',
            [2] = '{C:red}Self-destructs{} after converting 3 cards.',
            [3] = 'Will {C:red}not {}convert cards if hand size is',
            [4] = 'bigger than remaining conversions',
            [5] = 'Conversions remaining: #1#'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["wheeloffortune_wheeloff_jokers"] = true, ["wheeloffortune_drinks"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.FondueCardsLiquidCheese}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big(#context.scoring_hand) <= to_big(card.ability.extra.FondueCardsLiquidCheese) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_wheeloff_fondue)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            else
                card.ability.extra.FondueCardsLiquidCheese = math.max(0, (card.ability.extra.FondueCardsLiquidCheese) - 1)
            end
        end
    end
}