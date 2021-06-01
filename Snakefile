
include: "common.smk"
pepfile: config["pepfile"]


rule all:
    input:
        outfile = get_outfile(),
        samples = expand('{sample}.txt', sample=pep.sample_table["sample_name"])

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

rule sample:
    output:
        "{sample}.txt"
    log:
        "log/{sample}_touch.txt"
    container:
        "docker://debian:latest"
    shell: """
        touch {output} 2> {log}
    """
