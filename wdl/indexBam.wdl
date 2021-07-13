version 1.0

workflow runIndexBam {

    call indexBam

    output {
        File bamIndex = indexBam.bamIndex
    }
}

task indexBam {
    input {
        File inputBam

        Int memSizeGB = 4
        Int threadCount = 1
        Int diskSizeGB = 64
        String dockerImage = "biocontainers/samtools@sha256:da61624fda230e94867c9429ca1112e1e77c24e500b52dfc84eaf2f5820b4a2a"
    }

    command <<<

        set -o pipefail
        set -e
        set -u
        set -o xtrace

        ## Get basename of file
        inputBamFileName=$(basename -- "~{inputBam}")
        
        ## copy file to working dir (so index file is written in working dir)
        cp ~{inputBam} .
        
        ## index the bam file
        samtools index $inputBamFileName
    >>>

    output {
        File bamIndex = glob("*bam.bai")[0]
    }

    runtime {
        memory: memSizeGB + " GB"
        cpu: threadCount
        disks: "local-disk " + diskSizeGB + " SSD"
        docker: dockerImage
        preemptible: 1
    }
}
