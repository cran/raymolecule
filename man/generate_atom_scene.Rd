% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_atom_scene.R
\name{generate_atom_scene}
\alias{generate_atom_scene}
\title{Build Scene (atoms only)}
\usage{
generate_atom_scene(
  model,
  x = 0,
  y = 0,
  z = 0,
  scale = 1,
  center = TRUE,
  pathtrace = TRUE,
  material = rayrender::glossy,
  material_vertex = material_list(type = "phong")
)
}
\arguments{
\item{model}{Model extracted from a PDB or SDF file.}

\item{x}{Default `0`. X offset, applied after centering.}

\item{y}{Default `0`. Y offset, applied after centering.}

\item{z}{Default `0`. Z offset, applied after centering.}

\item{scale}{Default `1`. Amount to scale the inter-atom spacing.}

\item{center}{Default `TRUE`. Centers the bounding box of the model.}

\item{pathtrace}{Default `TRUE`. If `FALSE`, the `rayvertex` package will be used to render the scene.}

\item{material}{Default `rayrender::glossy`. Rayrender material to use when `pathtrace = TRUE`. Must be either `glossy`, `diffuse`, or `dielectric`.}

\item{material_vertex}{Default `rayvertex::material_list()`. Material to use when `pathtrace = FALSE`.
`diffuse`/`ambient` colors and `ambient_intensity` are determined automatically, but all other material
properties can be changed.}
}
\value{
Rayrender/rayvertex scene containing only the atoms in a molecule/protein.
}
\description{
Reads an SDF file and extracts the 3D molecule model
}
\examples{
#Generate a scene with caffeine molecule with just the atoms
\donttest{
get_example_molecule("caffeine") \%>\%
  read_sdf() \%>\%
  generate_atom_scene() \%>\%
  render_model(samples=256,sample_method="sobol_blue")

#Generate a rayvertex scene, using toon shading
shiny_toon_material = rayvertex::material_list(type="toon_phong",
                                               toon_levels=3,
                                               toon_outline_width=0.1)
get_example_molecule("caffeine") \%>\%
  read_sdf() \%>\%
  generate_atom_scene(pathtrace=FALSE, material_vertex = shiny_toon_material) \%>\%
  render_model(background="white")

#Generate a scene with caffeine, reducing the inter-atom spacing
get_example_molecule("caffeine") \%>\%
  read_sdf() \%>\%
  generate_atom_scene(scale=0.5) \%>\%
  render_model(samples=256,sample_method="sobol_blue")
}
}
