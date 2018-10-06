# A collection of targets that exercise the `{lang}:compile.bzl` rules
compile:
	bazel build \
		//android/example/proto:routeguide \
		//closure/example/proto:routeguide \
		//cpp/example/proto:routeguide \
		//csharp/example/proto:routeguide \
		//go/example/proto:routeguide \
		//java/example/proto:routeguide \
		//node/example/proto:routeguide \
		//objc/example/proto:routeguide \
		//php/example/proto:routeguide \
		//python/example/proto:routeguide \
		//ruby/example/proto:routeguide \
		//rust/example/proto:routeguide \
		//github.com/improbable-eng/ts-protoc-gen/example/proto:routeguide \
		//github.com/grpc/grpc-web/example/proto:routeguide_closure \
		//github.com/grpc/grpc-web/example/proto:routeguide_commonjs \
		//github.com/grpc/grpc-web/example/proto:routeguide_dts \
		//github.com/grpc/grpc-web/example/proto:routeguide_ts \

# A collection of targets that exercise the `{lang}:library.bzl` rules
library:
	bazel build \
		//closure/example/proto:person \
		//cpp/example/proto:person \
		//node/example/proto:person \

	# See https://github.com/bazelbuild/rules_dotnet/issues/72
	bazel build --spawn_strategy=standalone \
		//csharp/example/proto:person

# A collection of targets that build routeguide clients
clients: 
	bazel build \
		//android/example/routeguide:client \
		//closure/example/routeguide/client \
		//cpp/example/routeguide:client \
		//go/example/routeguide/client \
		//java/example/routeguide:client \
		//node/example/routeguide:client \
		//python/example/routeguide:client \
		//ruby/example/routeguide:client \
		//rust/example/routeguide:client \
		//github.com/grpc/grpc-web/example/routeguide/closure:bundle \
		//github.com/stackb/grpc.js/example/routeguide/client:bundle 

		# //dart/example/routeguide:client \

# A collection of targets that build routeguide servers
servers:
	bazel build \
		//cpp/example/routeguide:server \
		//go/example/routeguide/server \
		//java/example/routeguide:server \
		//node/example/routeguide:server \
		//python/example/routeguide:server \
		//ruby/example/routeguide:server \
		//rust/example/routeguide:server \

# A collection of test targets
tests:
	bazel test \
		//closure/example/routeguide/... \
		//github.com/stackb/grpc.js/example/routeguide/... \
		//github.com/grpc/grpc-web/example/routeguide/... \
		//cpp/example/routeguide/... \
		//java/example/routeguide/... \
		//go/example/routeguide/... \


# This one seems to have an issue with the missing 'qualified_name' pub package,
# but was working previously
compile_dart:
	bazel build \
		//dart/example/proto:routeguide 


# Cannot figure out the assembly reference issue here!
client_csharp:
	bazel build --spawn_strategy=standalone \
		//csharp/example/routeguide:client 

all: compiles clients servers tests