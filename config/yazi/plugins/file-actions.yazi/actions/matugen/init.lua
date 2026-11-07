local M = {}
function M.init(_, opts)
	local output, err = Command("./ziparchive.sh")
		:cwd(opts.workpath)
		:env("selection", table.concat(opts.selected, "\t"))
		:output()
end
return M

