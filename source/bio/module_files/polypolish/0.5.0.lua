-- The MIT License (MIT)
-- 
-- Copyright (c) 2023 Tufts University
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to
-- deal in the Software without restriction, including without limitation the
-- rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
-- sell copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
-- IN THE SOFTWARE.

help([==[

Description
===========
Polypolish is a tool for polishing genome assemblies with short reads. Unlike other tools in this category, Polypolish uses SAM files where each read has been aligned to all possible locations (not just a single best location). This allows it to repair errors in repeat regions that other alignment-based polishers cannot fix.

More information
================
 - BioContainers: https://biocontainers.pro/tools/polypolish
 - Home page:     https://github.com/rrwick/Polypolish
]==])

whatis("Name: Polypolish")
whatis("Version: 0.5.0")
whatis("Description: Polypolish is a tool for polishing genome assemblies with short reads.")
whatis("BioContainers: https://biocontainers.pro/tools/polypolish")
whatis("Home page:     https://github.com/rrwick/Polypolish")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "quay.io_biocontainers_polypolish:0.5.0--hdbdd923_4.sif"
local uri = "docker://quay.io/biocontainers/polypolish:0.5.0--hdbdd923_4"
local programs = {"polypolish", "polypolish_insert_filter.py"}
local entrypoint_args = ""

-- The absolute path to Singularity is needed so it can be invoked on remote
-- nodes without the corresponding module necessarily being loaded.
-- Trim off the training newline.
local singularity = capture("which singularity | head -c -1")

if (os.getenv("BIOC_IMAGE_DIR")) then
   image = pathJoin(os.getenv("BIOC_IMAGE_DIR"), image)

   if not (isFile(image)) then
      -- The image could not be found in the container directory
      if (mode() == "load") then
         LmodMessage("file not found: " .. image)
         LmodMessage("The container image will be pulled upon first use to the Singularity cache")
      end
      image = uri

      -- Alternatively, this could pull the container image and
      -- save it in the container directory
      --if (mode() == "load") then
      --   subprocess(singularity .. " pull " .. image .. " " .. uri)
      --end
   end
else
   -- Look for the image in the Singularity cache, and if not found
   -- download it when "singularity run" is invoked.
   image = uri
end
