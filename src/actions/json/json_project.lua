    local function formatArray(arr)
        local res = {}
        if #arr > 0 then
          for _, elem in ipairs(arr) do
            table.insert(res, elem)
          end
        end
        return res
    end
    
    local function formatArrayRelativeToProject(arr, prj)
        local res = {}
        for _, elem in ipairs(arr) do
          local abspath = path.getabsolute(path.join(prj.location, elem))
          table.insert(res, abspath)
        end
        return res
    end
    
    local function formatArrayRelativeToCwd(arr, prj, cwd)
        local res = {}
        for _, elem in ipairs(arr) do
          local abspath = path.getabsolute(path.join(prj.location, elem))
          table.insert(res, path.getrelative(cwd, abspath))
        end
        return res
    end

	function premake.json.project(prj)
        local res = {}
	
		-- Header
        res.version = 1.0
        res.name = prj.name
        res.kind = prj.kind
        res.language = prj.language
        res.id = prj.uuid
        res.cwd = _WORKING_DIR
        res.location = {}
        res.location.cwd = path.getrelative(res.cwd, prj.location)
        res.location.rel = path.getrelative(prj.solution.location, prj.location)
        res.configs = {}
		
		-- List the build configurations, and the settings for each
		for cfg in premake.eachconfig(prj) do
            local rescfg = {}
            rescfg.name = cfg.name
            rescfg.location = {}
            rescfg.location.rel = path.getrelative(cfg.project.location,cfg.location)
            rescfg.location.cwd = path.getrelative(res.cwd,cfg.location)
            rescfg.objectsdir = cfg.objectsdir
            rescfg.buildtarget = {}
            rescfg.buildtarget.rel = cfg.buildtarget
            rescfg.defines = formatArray(cfg.defines)
            rescfg.includedirs = {}
            rescfg.includedirs.rel = table.join(cfg.userincludedirs, cfg.includedirs)
            rescfg.includedirs.cwd = formatArrayRelativeToCwd(rescfg.includedirs.rel, prj, res.cwd)
            rescfg.libdirs = {}           
            rescfg.libdirs.rel = formatArray(cfg.libdirs)
            rescfg.libdirs.cwd = formatArrayRelativeToCwd(rescfg.libdirs.rel, prj, res.cwd)
            
            rescfg.links = {}
            rescfg.links.rel = premake.getlinks(cfg, "all", "fullpath")
            rescfg.flags = formatArray(cfg.flags)
            
            local rundir = cfg.debugdir or cfg.buildtarget.directory
            local absrundir=path.join(cfg.project.location, rundir)
            local targetdirrel = path.getrelative(absrundir, path.join(cfg.project.location, cfg.buildtarget.directory))
            local runcmd = path.join(cfg.project.location, cfg.buildtarget.fullpath)
           
            rescfg.run = {}
            rescfg.run.rel = {}
            rescfg.run.cwd = {}
            rescfg.run.rel.rundir = path.getrelative(cfg.location, path.getabsolute(path.join(cfg.location, rundir)))
            rescfg.run.rel.targetdir = path.getrelative(cfg.location, path.getabsolute(path.join(cfg.location, targetdirrel)))
            rescfg.run.rel.runcmd = path.getrelative(cfg.location, runcmd)
            rescfg.run.cwd.rundir = path.getrelative(res.cwd, path.getabsolute(path.join(cfg.location, rescfg.run.rel.rundir)))
            rescfg.run.cwd.targetdir = path.getrelative(res.cwd, path.getabsolute(path.join(cfg.location, rescfg.run.rel.targetdir)))
            rescfg.run.cwd.runcmd = path.getrelative(res.cwd, path.getabsolute(path.join(cfg.location, rescfg.run.rel.runcmd)))
            rescfg.run.runargs = formatArray(cfg.debugargs)
            
			if not cfg.flags.NoPCH and cfg.pchheader then
                rescfg.pchheader = cfg.pchheader
                rescfg.pchsource = cfg.pchsource
			end
            rescfg.buildoptions = formatArray(cfg.buildoptions)
            rescfg.linkoptions = formatArray(cfg.linkoptions)

            rescfg.prebuildcommands = formatArray(cfg.prebuildcommands)
            rescfg.prelinkcommands = formatArray(cfg.prelinkcommands)
            rescfg.postbuildcommands = formatArray(cfg.postbuildcommands)
            
            res.configs[rescfg.name] = rescfg
		end

        res.sources = {}
		
		-- List out the folders and files that make up the build
		local tr = premake.project.buildsourcetree(prj)
		premake.tree.sort(tr)
		premake.tree.traverse(tr, {
			onbranch = function(node, depth)
			end,
			
			onleaf = function(node, depth)
                local elem = {}
                local filepath = path.getabsolute(path.join(prj.location, node.cfg.name))
                elem.name = node.name
                elem.path = node.path:sub(1, (node.path:len() - elem.name:len()) )
                elem.location = {}
                elem.location.cwd = path.getrelative(res.cwd, filepath)
                elem.location.rel = path.getrelative(prj.location, filepath)
                table.insert(res.sources, elem)
			end
		})
		
        _p(json.encode(res))
	end
