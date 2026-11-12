import re,sys
# linear register-kind lint: catches "register was overwritten by something of another type before this call"
def regs(s):
    out=[]
    for tok in re.split(r'[,\s]+',s):
        if re.fullmatch(r'[vp]\d+',tok): out.append(tok)
    return out
def lint(path):
    errs=[]
    kind={}
    meth=None
    for n,ln in enumerate(open(path,encoding='utf-8'),1):
        s=ln.strip()
        if s.startswith('.method'): meth=s; kind={}; continue
        if s.startswith(':'): kind={k:v for k,v in kind.items() if k.startswith('p')}; continue   # labels: forget locals
        m=re.match(r'const-string (\w+),',s)
        if m: kind[m.group(1)]='Ljava/lang/String;'; continue
        m=re.match(r'new-instance (\w+), (L[^;]+;)',s)
        if m: kind[m.group(1)]=m.group(2); continue
        m=re.match(r'const(/\d+|/high16)? (\w+),',s)
        if m: kind[m.group(2)]='int'; continue
        m=re.match(r'check-cast (\w+), (L[^;]+;)',s)
        if m: kind[m.group(1)]=m.group(2); continue
        m=re.match(r'move-result-object (\w+)',s)
        if m: kind[m.group(1)]='?obj'; continue
        m=re.match(r'move-result (\w+)',s)
        if m: kind[m.group(1)]='int'; continue
        m=re.match(r'(?:iget-object|aget-object|sget-object) (\w+), ',s)
        if m: kind[m.group(1)]='?obj'; continue
        m=re.match(r'(?:move-object|move) (\w+), (\w+)',s)
        if m: kind[m.group(1)]=kind.get(m.group(2),'?'); continue
        m=re.match(r'invoke-(virtual|direct|interface) \{([^}]*)\}, (L[^;]+;)->(\w+|<init>)\(([^)]*)\)',s)
        if m:
            rs=regs(m.group(2)); cls=m.group(3); name=m.group(4); params=m.group(5)
            if rs:
                k=kind.get(rs[0])
                if k and k not in ('?obj','?','int') and name!='<init>':
                    # receiver is a known class; flag only clear String-vs-android.* / int-vs-object conflicts
                    if k=='Ljava/lang/String;' and cls.startswith('Landroid/'):
                        errs.append((n,f'{rs[0]} is String but called as {cls}->{name}'))
                if k=='int' and name!='<init>': errs.append((n,f'{rs[0]} is a primitive but used as receiver of {cls}->{name}'))
            # string args passed where a non-String object expected: skip (too noisy)
    return errs
bad=0
for p in sys.argv[1:]:
    e=lint(p)
    for n,msg in e: print(p.split('/')[-1],n,msg); bad+=1
print('lint done, issues:',bad)
