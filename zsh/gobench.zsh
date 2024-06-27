function gobench() {
	branch=`git rev-parse --abbrev-ref HEAD`
	if [[ "$1" != "" ]]; then
		filter="$1"
	else
		filter="Benchmark"
	fi

	if [[ $* == *\ -f* ]]; then
		rm bench-main
	fi
	if [ ! -f bench-main ]; then
		if [[ $(git diff --stat) != '' ]]; then
			echo "I need to run benchmarks on main, which requires a non-dirty repository"
			return 1
		fi

		echo "Running $filter on main branch"
		git checkout main
		for _ in $(seq 10); do
			go test -bench=$filter ./... >> bench-main
		done
	fi

	echo "Running $filter on $branch"
	git checkout $branch
	rm bench-branch
	for _ in $(seq 10); do
		go test -bench=$filter ./... >> bench-branch
	done

	echo "Running benchstat"
	benchstat bench-main bench-branch
}
