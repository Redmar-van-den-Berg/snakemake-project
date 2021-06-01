
include: "common.smk"

rule all:
    input:
        outfile = get_outfile()

rule example:
    output: 
        get_outfile()
    log:
        "log/stdout.txt"
    container:
        "docker://debian:latest"
    shell: """
        echo "Hello world!" > {output} 2> {log}
    """

