function gobench() {
	branch=`git rev-parse --abbrev-ref HEAD`

	if [[ $* != *\ -f* ]]; then
		rm bench-main
	fi
	if [ ! -f bench-main ]; then
		if [[ $(git diff --stat) != '' ]]; then
			echo "I need to run benchmarks on main, which requires a non-dirty repository"
			return 1
		fi

		echo "Running benchmarks on main branch"
		git checkout main
		for _ in $(seq 10); do
			go test -run Benchmark -bench=. ./... >> bench-main
		done
	fi

	echo "Running benchmarks on $branch"
	git checkout $branch
	rm bench-branch
	for _ in $(seq 10); do
		go test -run Benchmark -bench=. ./... >> bench-branch
	done

	echo "Running benchstat"
	benchstat bench-main bench-branch
}
