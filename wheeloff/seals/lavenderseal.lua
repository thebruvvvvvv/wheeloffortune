
SMODS.Seal {
    key = 'lavenderseal',
    pos = { x = 0, y = 0 },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Lavender Seal',
        label = 'Lavender Seal',
        text = {
            [1] = 'Creates a {C:wheeloffortune_mineral}Mineral {}card if this is the only card scored.'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                
                func = function()
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'mineral', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}