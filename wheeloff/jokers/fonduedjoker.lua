
SMODS.Joker{ --Fondued Joker
    key = "fonduedjoker",
    config = {
        extra = {
            FonduedJokerXMoney = 1
        }
    },
    loc_txt = {
        ['name'] = 'Fondued Joker',
        ['text'] = {
            [1] = 'Multiplies your {C:attention}money {}by X#1#,',
            [2] = '#1# increases by {X:attention,C:white}0.0025{} every time a {C:enhanced}Fondue {}card is scored.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["wheeloffortune_wheeloff_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.FonduedJokerXMoney}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_wheeloff_fondue"] == true then
                card.ability.extra.FonduedJokerXMoney = (card.ability.extra.FonduedJokerXMoney) + 0.0025
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * card.ability.extra.FonduedJokerXMoney
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.FonduedJokerXMoney), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}