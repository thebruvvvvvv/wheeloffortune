-- The Compass
SMODS.Blind {
    key = "the_compass",
    dollars = 6,
    mult = 1.75,
    pos = { x = 0, y = 2 },
    boss = { min = 3 },
    boss_colour = HEX("ada575"),
    atlas = 'Blinds', 
calculate = function(self, blind, context)
  if not blind.disabled then
    if context.debuff_card and context.debuff_card.area ~= G.jokers and context.debuff_card:get_seal() then
      return { debuff = true }
    end
  end
end
}

-- The Laceration
SMODS.Blind {
    key = "the_laceration",
    dollars = 6,
    mult = 1.8,
    pos = { x = 0, y = 0 },
    boss = { min = 5 },
    boss_colour = HEX("751a47"),
    atlas = 'Blinds',

    loc_txt = {
        ['name'] = 'The Laceration',
        ['text'] = {
            [1] = 'Destroy first played hand',
        },
    },

    calculate = function(self, blind, context)
        if context.destroy_card and context.cardarea == G.play and G.GAME.current_round.hands_played == 1 then
            return {
        remove = true,
        message = 'Destroyed!'
    }
end
end
}

--The Panopticon
SMODS.Blind {
    key = "the_panopticon",
    dollars = 7,
    mult = 1.85,
    pos = { x = 0, y = 3 },
    boss = { min = 3 },
    boss_colour = HEX("8c8a81"),
    atlas = 'Blinds',
    loc_txt = {
        ['name'] = 'The Panopticon',
        ['text'] = {
            [1] = 'Scored and held face cards make you lose $1.',
        },
    },
    calculate = function(self, blind, context)
    if not blind.disabled then
        if context.individual and context.other_card:is_face() then
            return {dollars = -1}
        end
    end
end
}

-- The Ripple
SMODS.Blind {
    key = "the_ripple",
    dollars = 6,
    mult = 1.75,
    pos = { x = 0, y = 5 },
    boss = { min = 3 },
    boss_colour = HEX("4054a3"),
    atlas = 'Blinds', 
calculate = function(self, blind, context)
  if not blind.disabled then
    if context.debuff_card and context.debuff_card.area ~= G.jokers and context.debuff_card:get_edition() then
      return { debuff = true }
    end
  end
end
}

--The Sailboat
SMODS.Blind{
    key = "the_sailboat",
    dollars = 5,
    mult = 2,
    boss_colour = HEX("a7e8d6"),
    atlas = 'Blinds', 
    boss = {min = 3},
    pos = { x = 0, y = 1 },
    config = {
        numer = 1,
        denum = 5,
    },
    in_pool = function(self)
        return true
    end,
    loc_vars = function (self)
        local n, d = SMODS.get_probability_vars(self, self.config.numer, self.config.denum, "wheeloffortune_sailboat_blind")
        return {
            vars = {
                n, d
            }
        }
    end,
    collection_loc_vars = function (self)
        local n, d = SMODS.get_probability_vars(self, self.config.numer, self.config.denum, "wheeloffortune_sailboat_blind")
        return {
            vars = {
                n, d
            }
        }
    end,
    calculate = function (self, blind, context)
        if context.hand_drawn and not blind.disabled then
            for i, card in ipairs(context.hand_drawn) do
                if not card:is_face(true) and SMODS.pseudorandom_probability(self, "wheeloffortune_sailboat_blind",self.config.numer, self.config.denum) then
                    card:set_debuff(true)
                end
            end
        end
    end
}