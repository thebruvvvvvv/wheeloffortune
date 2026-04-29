-- Brass
SMODS.Enhancement {
    key = 'brass',
    pos = { x = 1, y = 0 },
    config = { p_dollars = 3 },
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
        loc_txt = {
        name = 'Brass',
        text = {
            [1] = 'Gives {C:money}$3 {}when scored',
            [2] = 'no rank or suit.',
            [3] = ''
        }
    },
    atlas = 'CustomEnhancements',
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.p_dollars } }
    end,
}