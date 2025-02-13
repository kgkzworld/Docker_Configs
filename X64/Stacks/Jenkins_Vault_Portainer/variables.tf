locals {
  # envs is a map of sensitive values
  # env is a map of non-sensitive values
  envs = { for tuple in regexall("(.*)=(.*)", file(".env")) : tuple[0] => sensitive(tuple[1]) }
  env = { for tuple in regexall("(.*)=(.*)", file(".env")) : tuple[0] => tuple[1] }
}