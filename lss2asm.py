if __name__=="__main__":
    import argparse
    parser=argparse.ArgumentParser()
    parser.add_argument(
        "-p",
        "--lss_path",
        type=str,
        required=True,
        help="the path of .lss file"
    )
    args=parser.parse_args()
    #not include the tab (\t) in cmd
    #asm_pattern=r"(?:[ \dabcdef]+:\t[ \dabcdef]{2} [ \dabcdef]{2} [ \dabcdef]{2} [ \dabcdef]{2} \t)(?P<cmd>[\w]{1,})\t?(?P<args>[^;\r\n]*)?(?P<comment>;[^\r\n]*)?(?:[\r\n]{1,2})"
    #include the tab (\t) in cmd
    asm_pattern=r"(?:[ \dabcdef]+:\t[ \dabcdef]{2} [ \dabcdef]{2} [ \dabcdef]{2} [ \dabcdef]{2} \t)(?P<cmd>[\w]{1,})(?P<args>\t?[^;\r\n]*)?(?P<comment>;[^\r\n]*)?(?:[\r\n]{1,2})"
    with open(args.lss_path,mode='r') as lss:
        with open(args.lss_path.replace(".lss",".asm"),mode='w') as asm:
            import re
            for line in lss.readlines():
                result=re.match(string=line,pattern=asm_pattern)
                if result is None:
                    continue
                    pass
                else:
                    asmline=''
                    for group in result.groups():
                        if group is None:
                            continue
                            pass
                        asmline=asmline+str(group)
                        pass
                    asmline=asmline+'\n'
                    asm.write(asmline)
                    print(asmline,end='')
                    pass
                pass
            pass
        pass
    pass