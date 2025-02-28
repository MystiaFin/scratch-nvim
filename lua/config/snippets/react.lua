local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("typescriptreact", {
	-- React Functional Component with TypeScript
	s("rfc", {
		t({ "import React from 'react';", "", "interface Props {", "  " }),
		i(1, "prop: string"),
		t({ "", "}", "", "", "const " }),
		i(2, "ComponentName"),
		t({ ": React.FC<Props> = ({ " }),
		i(3, "prop"),
		t({ " }) => {", "  return (", "    <div>" }),
		i(4, "Content"),
		t({ "</div>", "  );", "};", "", "export default " }),
		i(5, "ComponentName"),
		t({ ";" }),
	}),
})
