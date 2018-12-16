-- An example solution generator; see _example.lua for action description

-- 
-- The solution generation function, attached to the action in _example.lua.
-- By now, premake.generate() has created the solution file using the name
-- provided in _example.lua, and redirected input to this new file.
--

	function premake.json.solution(sln)
        local res = {}
        
		-- If necessary, set an explicit line ending sequence
		-- io.eol = '\r\n'
	
		-- Let's start with a header
        res.version = 1.0
        res.name = sln.name
        res.cwd = _WORKING_DIR
        res.location = {}
        res.location.cwd = path.getrelative(res.cwd, sln.location)
        res.location.abs = sln.location
        res.configs = {}
        
		-- List the build configurations
		for _, cfgname in ipairs(sln.configurations) do
            table.insert(res.configs, cfgname)
		end
		
        res.projects = {}
        res.projectOrder = {}
		
		-- List the projects contained by the solution, with some info on each
		for prj in premake.solution.eachproject(sln) do
            local resprj = {}
            resprj.name = prj.name
            resprj.kind = prj.kind
            resprj.language = prj.language
            resprj.id = prj.uuid
            resprj.location = {}
            resprj.location.rel = path.getrelative(sln.location, prj.location)
            resprj.location.cwd = path.getrelative(res.cwd, prj.location)
            resprj.location.rel_json = resprj.name .. ".prj.json"
            resprj.location.cwd_json = path.getrelative(res.cwd, path.join(prj.location,resprj.location.rel_json))
            resprj.dependencies = {}
			
			-- List dependencies, if there are any
			local deps = premake.getdependencies(prj)
			if #deps > 0 then
				for _, depprj in ipairs(deps) do
                    local resdep = {}
                    resdep.name = depprj.name
                    resdep.id = depprj.uuid
                    table.insert(resprj.dependencies, resdep)
				end
			end
            
            res.projects[resprj.name] = resprj;
            table.insert(res.projectOrder, resprj.name)
		end
		_p(json.encode(res))		
	end
