env = Environment()
env['CC'] = 'clang'
env['CXX'] = 'clang++'

env.Append(CCFLAGS='-std=c11 -g -fno-common')
env.Append(LINKFLAGS='-std=c11 -g -fno-common')

# rvcc
rvcc = env.Program('rvcc', 'main.c')

# test
test = env.Alias('test', [], './test.sh')
env.AlwaysBuild(test)
Depends(test, rvcc)

# clean
clean = env.Alias('clean', [], ['scons -c', 'rm -rf tmp*'])
env.AlwaysBuild(clean)

