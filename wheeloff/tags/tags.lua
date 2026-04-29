SMODS.Tag{
    key = "geode_tag",
    loc_vars = function (self, info_queue, tag)
        info_queue[#info_queue+1] = G.P_CENTERS["p_wheeloffortune_mega_deposit_pack"]
    end,
    atlas = "wheeloffortune_Tags", pos = { x = 0, y = 0},
    apply = function (self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep("+",G.C.WHEELOFFORTUNE_DEPOSIT_P,function ()
                local card = SMODS.create_card{ key = 'p_wheeloffortune_mega_deposit_pack', area = G.play }
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end 
    end
}