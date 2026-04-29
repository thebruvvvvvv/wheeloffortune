
SMODS.Joker{ --Spelunker Potion
    key = "spelunkerpotion",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Spelunker Potion',
        ['text'] = {
            [1] = 'When this joker is sold,',
            [2] = 'creates 2 {C:dark_edition}Negative {}{C:wheeloffortune_mineral}Mineral {}cards.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["wheeloffortune_wheeloff_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                func = function()
                    
                    for i = 1, 2 do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                end
                                
                                play_sound('timpani')
                                local sets = {'Tarot', 'Planet', 'Spectral'}
                                local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                SMODS.add_card({ set = random_set, edition = 'e_negative', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
        if context.remove_playing_cards  then
        end
    end
}