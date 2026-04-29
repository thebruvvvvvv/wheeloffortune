
SMODS.Enhancement {
    key = 'fondue',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            dollars0 = 1.1,
            odds = 5
        }
    },
    loc_txt = {
        name = 'Fondue',
        text = {
            [1] = 'Multiplies {C:money}Money {}by {X:money,C:white}X1.1{}{}',
            [2] = '{C:green}1 in 5{} chance of {C:red}self-destructing{}.',
            [3] = ''
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * 1.1
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "X"..tostring(1.1), colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            if SMODS.pseudorandom_probability(card, 'group_0_0ca45f15', 1, card.ability.extra.odds, 'j_wheeloffortune_fondue', false) then
                context.other_card.should_destroy = true
                card.should_destroy = true
                
            end
        end
    end
}