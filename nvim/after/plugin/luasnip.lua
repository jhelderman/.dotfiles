local ls = require("luasnip")
ls.setup()
ls.add_snippets(
	"python",
	{
		ls.snippet(
		"pdb",
		{
			ls.text_node('__import__("pdb").set_trace()')
		}
		)
	}
)
