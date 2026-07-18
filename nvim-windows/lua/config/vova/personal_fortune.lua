--Vova here, copied this this file to add more quotes, I wanted some Sun Tzu
--up in here
math.randomseed(os.time())

local list_extend = vim.list_extend

--- @param line string
--- @param max_width number
--- @return table
local format_line = function(line, max_width)
    if line == "" then
        return { " " }
    end

    local formatted_line = {}

    -- split line by spaces into list of words
    local words = {}
    local target = "%S+"
    for word in line:gmatch(target) do
        table.insert(words, word)
    end

    local bufstart = " "
    local buffer = bufstart
    for i, word in ipairs(words) do
        if (#buffer + #word) <= max_width then
            buffer = buffer .. word .. " "
            if i == #words then
                table.insert(formatted_line, buffer:sub(1, -2))
            end
        else
            table.insert(formatted_line, buffer:sub(1, -2))
            buffer = bufstart .. word .. " "
            if i == #words then
                table.insert(formatted_line, buffer:sub(1, -2))
            end
        end
    end
    -- right-justify text if the line begins with -
    if line:sub(1, 1) == "-" then
        for i, val in ipairs(formatted_line) do
            local space = string.rep(" ", max_width - #val - 2)
            formatted_line[i] = space .. val:sub(2, -1)
        end
    end
    return formatted_line
end

--- @param fortune table
--- @param max_width number
--- @return table
local format_fortune = function(fortune, max_width)
    -- Converts list of strings to one formatted string (with linebreaks)
    local formatted_fortune = { " " } -- adds spacing between alpha-menu and footer
    for _, line in ipairs(fortune) do
        local formatted_line = format_line(line, max_width)
        formatted_fortune = list_extend(formatted_fortune, formatted_line)
    end
    return formatted_fortune
end

local get_fortune = function(fortune_list)
    -- selects an entry from fortune_list randomly
    local ind = math.random(1, #fortune_list)
    return fortune_list[ind]
end

-- Credit to @mhinz for compiling this list in vim-startify
local fortune_list = {
    {
        "\"You must understand that there is more than one path to the top of the mountain\"",
        "",
        "- Miyamoto Musashi, A Book of Five Rings"
    },
    {
        "\"You should not have any special fondness for a particular weapon, or anything else, for that matter. Too much is the same as not enough. Without imitating anyone else, you should have as much weaponry as suits you.\"",
        "",
        "- Miyamoto Musashi, A Book of Five Rings"
    },
    {
        "\"In the midst of chaos, there is also opportunity\"",
        "",
        "- Sun Tzu, The Art of War"
    },
    {
        "\"All warfare is based on deception. Hence, when we are able to attack, we must seem unable; when using our forces, we must appear inactive; when we are near, we must make the enemy believe we are far away; when far away, we must make him believe we are near.\"",
        "",
        "- Sun Tzu, The Art of War"
    },
    {
        "\"Victorious warriors win first and then go to war, while defeated warriors go to war first and then seek to win\"",
        "",
        "- Sun Tzu, The Art of War"
    },
    {
        "\"Let your plans be dark and impenetrable as night, and when you move, fall like a thunderbolt\"",
        "",
        "- Sun Tzu, The Art of War"
    },
    {
        "\"Quidquid latine dictum sit, altum sonatur.\n\n- Whatever is said in Latin sounds profound.\"",
        "",
        "- Roedy Green"
    },
    {
        "\"Yeah its probably better to call less times but yknow theres nothing more permanent than a temporary solution\"",
        "",
        "- Spencer Thomas"
    },
    {
        "\"Hope\" is the thing with feathers",
        "That perches in the soul",
        "And sings the tune without the words",
        "And never stops - at all",
        "",
        "And sweetest - in the gale - is heard",
        "And sore must be the storm",
        "That could abash the little bird",
        "That kept so many warm",
        "",
        "I've heard it in the chillest land",
        "And on the strangest Sea",
        "Yet - never - in Extremity",
        "It asked a crumb - of me",
        "",
        "- \"Hope\" is the thing with feathers, by Emily Dickingson",
    },
    {
        "Nature's first green is gold,",
        "Her hardest hue to hold.",
        "Her early leaf's a flower;",
        "But only so an hour.",
        "Then leaf subsides to leaf.",
        "So Eden sank to grief,",
        "So dawn goes down to day.",
        "Nothing gold can stay.",
        "",
        "- Nothing Gold Can Stay, by Robert Frost",
    },
    {
        "There was no longer any need for my mind to force my limbs to run faster - my body became a unity in motion much greater than the sum of its component parts.",
        "",
        "I never thought of length of stride or style, or even my judgement of pace.  All this had become automatically ingrained. In this was a singleness of drive could be achieved.",
        "",
        "It was as if all my muscles were a part of a perfectly tuned machine.",
        "",
        "- The First Four Minutes (ch.13), by Sir Roger Bannister",
    },
    {
        "It's okay to get emotional, I often find myself getting misty-eyed when consuming media.",
        "",
        "I believe that it's not simply a result of being old, but more due to our experiences & ability to relate to people increasing as we grow.",
        "",
        "- Ethan Vaughn",
    },
    {
        "I would add that if you try to mark everything, you'll never remember what's what.",
        "",
        "Only mark things you need in a hurry.",
        "",
        "And watch out for goblins.",
        "",
        "- Goblin Slayer",
    },
    {
        "If you don't plan to do anything until you've been taught, then teaching you will change nothing.",
        "",
        "- Goblin Slayer",
    },
    {
        "This get's a litle of topic, but I heard this once in some documentary:",
        "",
        "'If you want to make a movie that rivals Star Wars, you can't watch Star Wars. Go watch what George Lucas was watching for the purpose of making Star Wars.'",
        "",
        "Follow what's already been depicted, and you might just end up with an inferior copy.",
        "",
        "- Kentaro Miura",
    },
    {
        "If you don’t know a word, look it up or die.",
        "",
        "- Mark Uakick, 'Reading a Poem: 20 Strategies'",
    },
    {
        "Comments are good, but there is also a danger of over-commenting. NEVER try to explain HOW your code works in a comment: it's much better to write the code so that the _working_ is obvious, and it's a waste of time to explain badly written code.",
        "",
        "Generally, you want your comments to tell WHAT your code does, not HOW. Also, try to avoid putting comments inside a function body: if the function is so complex that you need to separately comment parts of it, you should probably go back to chapter 5 for a while. You can make small comments to note or warn about something particularly clever (or ugly), but try to avoid excess. Instead, put the comments at the head of the function, telling people what it does, and possibly WHY it does it.",
        "",
        "- Linus Torvalds, CodingStyle, linux kernal",
    },


}

--- @return table
--- @param opts number|table? optional
--- returns an array of strings
local main = function(opts)
    local options = {
        max_width = 54,
        fortune_list = fortune_list,
    }

    if type(opts) == "number" then
        options.max_width = opts
    elseif type(opts) == "table" then
        options = vim.tbl_extend("force", options, opts)
    end

    local fortune = get_fortune(options.fortune_list)
    local formatted_fortune = format_fortune(fortune, options.max_width)

    return formatted_fortune
end

return main
