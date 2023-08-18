return {
	Name = "announce",
	Aliases = { "m" },
	Description = "Makes a server-wide announcement in a form of pop up.",
	Group = "DefaultAdmin",
	Args = {
		{
			Type = "string",
			Name = "text",
			Description = "The announcement text.",
		},
	},
}
