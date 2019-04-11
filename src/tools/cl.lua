--
-- gcc.lua
-- Provides GCC-specific configuration strings.
-- Copyright (c) 2002-2011 Jason Perkins and the Premake project
--


	premake.cl = { }
	premake.cl.namestyle = "windows"
	premake.cl.style = "cl"

--
-- Set default tools
--

	premake.cl.cc     = "clang-cl"
	premake.cl.cxx    = "clang-cl"
	premake.cl.ar     = "lib"
	premake.cl.link   = "link"
	premake.cl.rc     = "windres"
	premake.cl.link_output = "/OUT:"




--
-- Map platforms to flags
--

	premake.cl.platforms =
	{
		Native = {

		},
		x32 = {
			ldflags = "/MACHINE:X86",
		},
		x64 = {
			ldflags = "/MACHINE:X64",
		}
	}

	local platforms = premake.cl.platforms


	local function add_trailing_slash(dir)
		if dir:len() > 0 and dir:sub(-1) ~= "/" then
			return dir.."/"
		end
		return dir
	end

--
-- Returns a list of compiler flags, based on the supplied configuration.
--
	function premake.cl.getclflags(cfg)
		local compileroptions = {
			'/nologo',
			'/c',
			'/Zc:inline',
			'/errorReport:none',
			'/FS',
			}

		if cfg.options.ForceCPP then
			table.insert(compileroptions, '/TP')
		end

		if cfg.flags.PedanticWarnings or cfg.flags.ExtraWarnings then
			table.insert(compileroptions, '/W4')
		end

		if (cfg.flags.NativeWChar == false or cfg.flags.NoNativeWChar) then
			table.insert(compileroptions, '/Zc:wchar_t-')
		end

		if (cfg.flags.EnableMinimalRebuild or cfg.flags.NoMultiProcessorCompilation) then
			-- Not compatible with FastBuild
		end

		if cfg.flags.FloatFast then
			table.insert(compileroptions, '/fp:fast')
		elseif cfg.flags.FloatStrict then
			table.insert(compileroptions, '/fp:strict')
		else
			table.insert(compileroptions, '/fp:precise')
		end

		if cfg.flags.FastCall then
			table.insert(compileroptions, '/Gr')
		elseif cfg.flags.StdCall then
			table.insert(compileroptions, '/Gd')
		end

		if cfg.flags.UnsignedChar then
			table.insert(compileroptions, '/J')
		end

		if premake.config.isdebugbuild(cfg) then
			if cfg.flags.StaticRuntime then
				table.insert(compileroptions, '/MTd')
			else
				table.insert(compileroptions, '/MDd')
			end
		else
			if cfg.flags.StaticRuntime then
				table.insert(compileroptions, '/MT')
			else
				table.insert(compileroptions, '/MD')
			end
		end

		if cfg.flags.Symbols then
			if (cfg.flags.C7DebugInfo) then
				table.insert(compileroptions, '/Z7')
			else
				table.insert(compileroptions, '/Zi')
				local targetdir = add_trailing_slash(cfg.buildtarget.directory)
				table.insert(compileroptions, string.format("/Fd\"%s%s.pdb\"", targetdir, cfg.buildtarget.basename))
			end
		end

		local isoptimised = true
		if (cfg.flags.Optimize) then
			table.insert(compileroptions, '/Ox')
		elseif (cfg.flags.OptimizeSize) then
			table.insert(compileroptions, '/Os')
		elseif (cfg.flags.OptimizeSpeed) then
			table.insert(compileroptions, '/O2')
		else
			isoptimised = false
		end

		if isoptimised then
			-- Refer to vstudio.vcxproj.lua about FunctionLevelLinking
			if cfg.flags.NoOptimizeLink and cfg.flags.NoEditAndContinue then
				table.insert(compileroptions, '/GF-')
				table.insert(compileroptions, '/Gy-')
			end
		else
			table.insert(compileroptions, '/Gy')
			table.insert(compileroptions, '/Od')
			if not cfg.flags.NoRuntimeChecks then
				table.insert(compileroptions, '/RTC1')
			end
		end

		if cfg.flags.NoBufferSecurityCheck then
			table.insert(compileroptions, '/GS-')
		else
			table.insert(compileroptions, '/GS')
		end

		if cfg.flags.FatalWarnings then
			table.insert(compileroptions, '/WX')
		else
			table.insert(compileroptions, '/WX-')
		end

		if cfg.platform == 'x32' then
			if cfg.flags.EnableSSE2 then
				table.insert(compileroptions, '/arch:SSE2')
			elseif cfg.flags.EnableSSE then
				table.insert(compileroptions, '/arch:SSE')
			end
		end

		if cfg.platform == 'x64' then
			if cfg.flags.EnableAVX then
				table.insert(compileroptions, '/arch:AVX')
			elseif cfg.flags.EnableAVX2 then
				table.insert(compileroptions, '/arch:AVX2')
			end
		end

		if cfg.flags.NoExceptions then
		else
			if cfg.flags.SEH then
				table.insert(compileroptions, '/EHa')
			else
				table.insert(compileroptions, '/EHsc')
			end
		end

		if cfg.flags.NoRTTI then
			table.insert(compileroptions, '/GR-')
		else
			table.insert(compileroptions, '/GR')
		end

		if cfg.flags.NoFramePointer then
			table.insert(compileroptions, '/Oy-')
		else
			table.insert(compileroptions, '/Oy')
		end
		return compileroptions
	end

	function premake.cl.getcppflags(cfg)
		local flags = { "/TP" }
		return table.join(flags, premake.cl.getclflags(cfg))
	end


	function premake.cl.getcflags(cfg)
		local flags = {}
		return table.join(flags, premake.cl.getclflags(cfg))
	end


	function premake.cl.getcxxflags(cfg)
		local flags = {}
		return flags
	end


	function premake.cl.getobjcflags(cfg)
		return table.translate(cfg.flags, objcflags)
	end


--
-- Returns a list of linker flags, based on the supplied configuration.
--

	function premake.cl.getldflags(cfg)
		local result = { }

		-- silence "linking as no debug info" nonsense
		table.insert(result, "/IGNORE:4099")

		if cfg.flags.Symbols then
			if cfg.flags.FullSymbols then
				table.insert(result, "/DEBUG:FULL")
			else
				table.insert(result, "/DEBUG")
			end
		end

		local preferOptimize = false
		if cfg.flags.Optimize or cfg.flags.OptimizeSize or cfg.flags.OptimizeSpeed then
			preferOptimize = true
		end

		if cfg.flags.NoOptimizeLink or preferOptimize == false then
			table.insert(result, "/OPT:NOREF")
			table.insert(result, "/OPT:NOICF")
			table.insert(result, "/OPT:NOLBR")
		else
			table.insert(result, "/OPT:REF")
			table.insert(result, "/OPT:ICF")
			table.insert(result, "/OPT:LBR")
		end

		if cfg.flags.LoadAllSymbols then
			-- not implemented.
		end

		if cfg.kind == "Bundle" then
			-- not implemented.
			error("Bundles are not supported")
		end

		if cfg.kind == "StaticLib" then
			table.insert(result, "/LIB")
		end

		if cfg.kind == "SharedLib" then
			table.insert(result, "/DLL")
		end

		if cfg.kind == "ConsoleApp" then
			table.insert(result, "/SUBSYSTEM:CONSOLE")
		end

		if cfg.kind == "WindowedApp" then
			table.insert(result, "/SUBSYSTEM:WINDOWS")
		end

		table.insert(result, "/NOLOGO")

		local platform = platforms[cfg.platform]
		table.insert(result, platform.flags)
		table.insert(result, platform.ldflags)

		return result
	end

	function premake.cl.getldflags_post(cfg)
		local result = {}
		return result
	end


--
-- Return a list of library search paths. Technically part of LDFLAGS but need to
-- be separated because of the way Visual Studio calls GCC for the PS3. See bug
-- #1729227 for background on why library paths must be split.
--

	function premake.cl.getlibdirflags(cfg)
		local result = { }
		for _, value in ipairs(premake.getlinks(cfg, "all", "directory")) do
			table.insert(result, '/LIBPATH:\"' .. value .. '\"')
		end
		return result
	end

--
-- Given a path, return true if it's considered a real path
-- to a library file, false otherwise.
--  p: path
--
	function premake.cl.islibfile(p)
		if path.getextension(p) == ".lib" then
			return true
		end
		return false
	end

--
-- Returns a list of project-relative paths to external library files.
-- This function examines the linker flags and returns any that seem to be
-- a real path to a library file (e.g. "path/to/a/library.a", but not "GL").
-- Useful for adding to targets to trigger a relink when an external static
-- library gets updated.
--  cfg: configuration
--
	function premake.cl.getlibfiles(cfg)
		local result = {}
		for _, value in ipairs(premake.getlinks(cfg, "system", "fullpath")) do
			if premake.cl.islibfile(value) then
				table.insert(result, _MAKE.esc(value))
			end
		end
		return result
	end

--
-- This is poorly named: returns a list of linker flags for external
-- (i.e. system, or non-sibling) libraries. See bug #1729227 for
-- background on why the path must be split.
--

	function premake.cl.getlinkflags(cfg)
		local result = {}
		for _, value in ipairs(premake.getlinks(cfg, "system", "basename")) do
			table.insert(result, '' .. _MAKE.esc(value) .. ".lib")
		end
		return result
	end

--
-- Get the arguments for whole-archive linking.
--

	function premake.cl.wholearchive(lib)
		return {lib}
	end

--
-- Get flags for passing to AR before the target is appended to the commandline
--  prj: project
--  cfg: configuration
--  ndx: true if the final step of a split archive
--

	function premake.cl.getarchiveflags(prj, cfg, ndx)
		local result = {}
		table.insert(result, "/NOLOGO")

		-- silence "This object file does not define any previously undefined public symbols, so it will not be used by any link operation that consumes this library" nonsense
		table.insert(result, "/IGNORE:4221")

		return result
	end


--
-- Decorate defines for the GCC command line.
--

	function premake.cl.getdefines(defines)
		local result = { }
		for _,def in ipairs(defines) do
			table.insert(result, "/D" .. def)
		end
		return result
	end

--
-- Decorate include file search paths for the GCC command line.
--

	function premake.cl.getincludedirs(includedirs)
		local result = { }
		for _,dir in ipairs(includedirs) do
			table.insert(result, "/I\"" .. dir .. "\"")
		end
		return result
	end

--
-- Decorate user include file search paths for the GCC command line.
--

	function premake.cl.getquoteincludedirs(includedirs)
		local result = { }
		for _,dir in ipairs(includedirs) do
			table.insert(result, "/I\"" .. dir .. "\"")
		end
		return result
	end

--
-- Decorate system include file search paths for the GCC command line.
--

	function premake.cl.getsystemincludedirs(includedirs)
		local result = { }
		for _,dir in ipairs(includedirs) do
			table.insert(result, "/I\"" .. dir .. "\"")
		end
		return result
	end

--
-- Return platform specific project and configuration level
-- makesettings blocks.
--

	function premake.cl.getcfgsettings(cfg)
		return platforms[cfg.platform].cfgsettings
	end
