#  look for tip
/^changeset/ { cs = $0 }
/tag:         tip/ {
        split(cs, csa, /:/)
        csn = csa[2]
        gsub(/ /, "", csn)
        print csn
}
